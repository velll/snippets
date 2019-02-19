---
title: 'Building database URLs'
---
Here's how you build a URL.
```
postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]
```

And here are a few examples.
```
postgresql://
postgresql://localhost
postgresql://localhost:5432
postgresql://localhost/mydb
postgresql://user@localhost
postgresql://user:secret@localhost
postgresql://other@localhost/otherdb?connect_timeout=10&application_name=myapp
postgresql://localhost/mydb?user=other&password=secret
```
