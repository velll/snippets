---
title: 'Static site configuration example'
---
```
server {
  # server name (for virtual server configuration)
  # this server will only listen to requests made to this name
  server_name paulgoesdeep.com www.paulgoesdeep.com;

  # path to the site root
  root /var/www/<site-directory>;

  # default HTTP port
  listen 80;
  listen [::]:80;

  # index page under root
  index index.html;

  # static html files only
  location / {
    try_files $uri $uri.html $uri/ =404;
  }
}
```
