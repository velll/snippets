---
title: "Managing images"
---
List all local images
```
$ docker image ls
```

Pull an image
```
$ docker pull <name>
```

Remove image
```
$ docker image rm <name>
$ docker rmi <name>
```

Remove all images
```
$ docker rmi $(docker images -a -q)
```
