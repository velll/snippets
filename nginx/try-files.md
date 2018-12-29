---
title: 'Try_files syntax'
---
Try files syntax for when you want both `/path.html` and `/path` to work
```
server {
  ...

  location /path/to/location {
    try_files $uri $uri.html $uri/ =404;
  }
  ...
}
```
