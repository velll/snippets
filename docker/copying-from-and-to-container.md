---
title: "Copying from and to a container"
---
**Approach 1:** Volumes. Enough said.

**Approach 2:** `docker cp` from host.

Copy a file from a container (use container id or name)
```bash
$ docker cp container_name:/path/to/file /path/to/target/file
```

Copy a file to a container (use container id or name)

```bash
$ docker cp /path/to/file container_name:/path/to/file/inside
```
