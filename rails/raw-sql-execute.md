---
title: 'ActiveRecord and raw SQL: Execute'
---
Execute a query
```ruby
ApplicationRecord.connection.exec_query("update meetings set planned_for = NOW() + INTERVAL '1 DAY' where id = 1")
```

Bind variables
```ruby
ApplicationRecord.connection.exec_query("update meetings set planned_for = NOW() + INTERVAL '1 DAY' where id = $1", 'sql', [[nil, 1]])
```

Properly annotated bind variables
```ruby
binds = [ActiveRecord::Relation::QueryAttribute.new(nil, 1, ActiveRecord::Type::Value.new)]
ApplicationRecord.connection.exec_query("update meetings set planned_for = NOW() + INTERVAL '1 DAY' where id = $1", 'sql', binds)
```

## Migrations

```ruby
execute <<-SQL
  DROP TABLE meetings
SQL
```
