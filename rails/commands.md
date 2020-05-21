---
title: 'Rails console commands'
---

Create a new rails in a current directory
```bash
$ rails new .
```

What you actually need
```bash
rails new --skip-test --webpack=react --skip-action-mailer --database=postgres
```

Scaffolding a new resource (controller, model, views, routes)
```bash
$ rails generate scaffold name attribute:type
$ rails g scaffold name attribute:type
```

New controller (with views)
```bash
$ rails g controller name
```

Start a dev server
```bash
$ rails s
```

Start a development console
```bash
$ rails c
```
