---
title: 'Docker containers: running and managing'
---
# Starting up
Run in foreground (pulls a container from a hub if there isn't one available locally).
- i = interactive (keeps STDIN open)
- t = tty - Open prompt

```
$ docker container run -it ruby
```

Run in background.
```
$ docker container run -d ruby
```

Map ports (host:container).
```
$ docker container run -d -p 80:80 nginx
```

Make ports available for localhost only(!)
```
$ docker container run -d -p 127.0.0.1:80:80 nginx
```

Naming a container.
```
$ docker container run -d -p 80:80 --name nginx-server nginx
```

Tell a container to automatically remove itself when stopped.
```
$ docker container run --rm -it ruby
```

# Checking in on containers
List running containers
```
$ docker ps
$ docker container ls
```

Include stopped containers
```
$ docker container ls -a
```

Get logs (Use name or ID)
```
$ docker container logs <name-or-id>
```

List processes running in container
```
$ docker container top <name-or-id>
```

View info on container
```
$ docker container inspect <name>
```

Performance stats (cpu, mem, network, disk, etc)
```
$ docker container stats <name>
```

# Accessing a container

Create a container and bash into it
```
$ docker container run -it --name nginx-server nginx bash
```

Docker `exec` to bash into a running container
```
$ docker container exec -it postgres bash
```

Alpine does not iclude `bash` so use `sh`
```
$ docker container run -it alpine sh
```

# Cleaning up

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

More at [removing containers](cleaning-up)
