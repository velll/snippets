---
title: 'Cleaning up Docker containers'
---
# Containers

Stop a container
```
$ docker container stop <container-id-or-name>
```

Stop all containers.
```
$ docker stop $(docker ps -aq)
```

Remove a container. Won't stop a running container.
```
$ docker container rm <ID>
```

Forcibly remove a running container.
```
$ docker container rm -f <ID>
```

Remove multiple containers
```
$ docker container rm <ID-1> <ID-2> <ID-3>
```

Remove all containers. Will fail for running containers.
```
$ docker rm $(docker ps -aq)
```

# Volumes
View *dangling* volumes
```
$ docker volume ls -qf dangling=true
```

Remove unused volumes
```
$ docker volume prune
```
