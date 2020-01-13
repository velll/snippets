---
title: 'Docker volumes'
---
Volumes are for
- hooking up container file system to host file system,
- persistence — storing data in host file system means data survives when you stop the container.

Anonymous volume
```bash
$ docker run -d --rm -v /home/paul/pgdata:/var/lib/postgresql/data postgres
```

Named volume
```bash
$ docker volume create pgdata
$ docker run -d --rm -v pgdata:/var/lib/postgresql/data postgres
```

# Managing volumes

List all
```bash
$ docker volume ls
```

Cleanup unused volumes
```bash
$ docker volume prune
```

Find if an image expects a volume
```bash
$ docker image inspect postgres | grep Volumes -A 5
```

Find a volume used by a container
```bash
$ docker container inspect <name-or-id>
```

Inspect a named volume
```bash
$ docker volume inspect <volume-name>
```
