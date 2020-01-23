---
title: 'Networking in Docker'
---
View published ports of a container
```bash
$ docker container port <name-or-id>
```

List docker networks
```bash
$ docker network ls
```
`bridge` or `docker0` is a default docker network.

Inspect network
```bash
$ docker network inspect <network-name>
```

Create a new network
```bash
$ docker network create <name>
```

Create container with network
```bash
$ docker container run -d --name <container-name> --network <network-name> postgres
```

Connect existing container to network
```bash
$ docker network connect <network-name> <container-name>
```

Disconnect container from network
```bash
$ docker network disconnect <network-name> <container-name>
```
