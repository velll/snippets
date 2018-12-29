---
title: 'Caching static media'
---
```
server {
...
  # media cache
  location ~* \.(jpg|jpeg|png|gif|ico)$ {
    expires 7d;
  }
...
}
```
