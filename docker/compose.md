---
title: 'Docker compose file'
---
Run in background
```
$ docker-compose up -d
```

Run in foreground
```
$ docker-compose up
```

Stop and cleanup
```
$ docker-compose down
```

Run using custom configuration
```bash
$ docker-compose -f docker-compose.local.yml up -d
```

# Configuration example

This is what I use for my drone.io setup. Seems like a neat example with a few interesting features:
- volumes,
- envirnoment,
- port publishing,
- containers depending on each other,
- giving a container access to `/var/run/docker.sock` allows a container to fire up new containers.

```yaml
version: '2'

services:
  drone-server:
    image: drone/drone:1
    container_name: drone
    ports:
      - 8002:80    # host:container
    volumes:
      - /var/lib/drone:/data # host:container
    restart: always
    environment:
      - DRONE_AGENTS_ENABLED=true
      - DRONE_GITHUB_SERVER=https://github.com
      - DRONE_GITHUB_CLIENT_ID=ACLIENTID
      - DRONE_GITHUB_CLIENT_SECRET=WOWSUCHSECRET
      - DRONE_RPC_SECRET=MUCHSECURE
      - DRONE_SERVER_HOST=localhost
      - DRONE_SERVER_PROTO=http
      - DRONE_DATADOG_ENABLED=false

  drone-agent:
    image: drone/drone:1
    container_name: drone-agent
    ports:
       - 8003:3000 # host:container
    restart: always
    depends_on:
      - drone-server
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - DRONE_RPC_PROTO=http
      - DRONE_RPC_HOST=localhost
      - DRONE_RPC_SECRET=MUCHSECURE
      - DRONE_RUNNER_CAPACITY=2
      - DRONE_RUNNER_NAME=localRunner
```
