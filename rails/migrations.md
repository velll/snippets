---
title: "Rails migrations"
---

Generate new one
```bash
$ rails g migration add_some_field_to_some_table
```

Create db
```bash
$ rails db:create
```

Run migrations
```bash
$ rails db:migrate
```

Rollback
```bash
$ rails db:rollback STEP=1
```

Recreate test DB
```bash
RAILS_ENV=test rails db:drop db:create db:schema:load
```
