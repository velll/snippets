---
title: Bisect
---
Useful when you're trying to find when a bug got in. Every step is bisecting the commit log.

```bash
$ git bisect start
```

Has the bug?
```bash
$ git bisect bad
```

Doesn't have the bug?
```bash
$ git bisect good
```
