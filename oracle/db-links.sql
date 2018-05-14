-- If new db is on the same domain, only specify the db name in connect string. Specify the full string if it's not.
create database link <db-name> connect to <user> identified by <password> using <connect-string>
