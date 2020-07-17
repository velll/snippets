---
title: 'Running a dev DB server in docker'
---

Basically make sure you keep your data by specifying the volume mapping
```bash
$ docker run -d -v /home/paul/postgres-dev:/var/lib/postgresql/data --name mydb postgres
```

Or just start with a simple DB+redis network using docker-compose
```
version: '2'

services:
  postgres:
    image: postgres:latest
    container_name: cool-new-idea-postgres
    ports:
      - 127.0.0.1:5432:5432
    restart: always
  redis:
    image: redis:latest
    container_name: cool-new-idea-redis
    ports:
      - 127.0.0.1:6379:6379
    restart: always
```
