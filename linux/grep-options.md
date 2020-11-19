---
title: 'Grep options'
---

Basic
```bash
$ grep -ri blabla *
```

Exclude meaningless directories
```bash
grep -R --exclude-dir={node_modules,server} TODO *
```

Find output NOT matching the pattern
```bash
```
