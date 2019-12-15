---
title: 'Running a Mongo docker container'
---
Run a temporary instance
```bash
$ docker run -d \
    -e MONGO_INITDB_ROOT_USERNAME=username \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    -e MONGO_INITDB_DATABASE=dbname \
    --name mongo_server \
    mongo
```
