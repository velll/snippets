---
title: 'Oracle text context indexes'
---
```sql
-- Create index command (omit parameters when not needed)
CREATE INDEX <index-name>
ON <table-name> (<column-name>)
INDEXTYPE IS CTXSYS.CONTEXT
PARAMETERS ('DATASTORE <datastore-name>
             WORDLIST <wordlist-name>
             LEXER <lexer-name>
             STOPLIST <stoplist-name>')

-- Synchronize index contents
exec CTX_DDL.SYNC_INDEX(:index_name);
-- Rebuild index
exec CTX_DDL.OPTIMIZE_INDEX(:index_name, 'REBUILD');
-- Sometimes you might want the generic rebuild, but it doesn't usually do anything
alter index <index-name> rebuild;

-- Parameters
-- Datastore — indexing more than one column or function
-- Stoplist — list of tokens to ignore
-- Wordlist — weird preferences (fuzzy search, substring indexing, etc)
-- Lexer - token preferences (printjoins, etc)
BEGIN
  CTX_DDL.CREATE_PREFERENCE(:wordlist_name, 'BASIC_WORDLIST');
  CTX_DDL.SET_ATTRIBUTE(:wordlist_name, 'SUBSTRING_INDEX', 'YES');
END;
/

BEGIN
  CTX_DDL.CREATE_PREFERENCE(:lexer_name, 'BASIC_LEXER');
  -- do not 'tokenize' by '/'
  CTX_DDL.SET_ATTRIBUTE(:lexer_name, 'PRINTJOINS', '/');
END;
/

-- Commands for creating and dropping stoplists
BEGIN
  CTX_DDL.CREATE_STOPLIST(
    stoplist_name => :stoplist_name,
    stoplist_type => 'BASIC_STOPLIST');
END;
/
BEGIN
  CTX_DDL.DROP_STOPLIST(
    stoplist_name => :stoplist_name);
END;
/
-- Create and index without a stoplist first.
-- Check the most common tokens in dr$<index-name>$i.
-- Add stopwords
BEGIN
  CTX_DDL.ADD_STOPWORD(
    stoplist_name => :stoplist_name,
    stopword      => :token);
END;
/
-- If you want to check existing stopwords, query CTX_STOPWORDS
select *
from   CTX_STOPWORDS
WHERE  SPW_STOPLIST = :stoplist_name
and    spw_word     = NEW_SPW.token_text

-- Rebuild the index with a new stoplist
ALTER INDEX <index-name> REBUILD
PARAMETERS('REPLACE STOPLIST <stoplist-name>');
```
