---
title: 'ActiveRecord and raw SQL: Select'
---

## Models

Select a resultset of models with SQL
```ruby
Meeting.find_by_sql('select * from meetings where id = 1')
```

Same but with bind variables
```ruby
Meeting.find_by_sql('select * from meetings where id = $1', [[nil, 1]])
```

Same but with proper annotations
```ruby
binds = [ActiveRecord::Relation::QueryAttribute.new(nil, 1, ActiveRecord::Type::Value.new)]
Meeting.find_by_sql('select * from meetings where id = $1', binds)
```

## Abstract resultsets
```ruby
query = <<-SQL
  select *
  from meetings
  where id = $1
SQL

ApplicationRecord.connection.select_all(query, 'sql', binds)
```
`.to_a` to make results palatable.

## A single value
```ruby
ActiveRecord::Base.connection.select_value('select name from meetings where id = 1')
```
