---
title: 'Removing objects in origin'
---
Remove local branch
```bash
$ git branch -d <branch-name>
```

Remove origin branch
```bash
$ git push origin :<branch-name>
```

Remove local tag
```bash
$ git tag -d <tag-name>
```

Remove origin tag
```bash
$ git push origin :refs/tags/<tag-name>
```
