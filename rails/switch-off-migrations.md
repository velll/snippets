---
title: 'Switching off migrations warnings'
---

Switch off migrations whining for those of us who don't use migrations
```ruby
# in config/environments/development.rb

# Raise an error on page load if there are pending migrations.
config.active_record.migration_error = false # was :page_load
```
