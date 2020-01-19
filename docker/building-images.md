---
title: 'Building images with Dockerfiles'
---
Build an image using `Dockerfile` from current dir.
```bash
$ docker build -t <image-name> .
```

# Dockerfile keywords

| `FROM`    | Base image (e.g alpine)                                       |
| `ENV`     | Environment variables                                         |
| `COPY`    | Copy files from host to container (e.g. COPY . .)             |
| `RUN`     | Run during build                                              |
| `EXPOSE`  | Ports to expose (doesn't publish, more of a documentation)    |
| `CMD`     | Final command run when you launch a new container from image  |
| `WORKDIR` | Sets working directory                                        |

Everything from base images is included in new image
```
FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY index.html index.html
```

Run a container
```
$ docker container run -p 80:80 --rm <new-image-name>
```

Pull a custom `Dockerfile` and build an image locally
```bash
$ docker build -t yarnpkg/dev -f Dockerfile.dev .
```
