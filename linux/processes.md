---
title: 'PS (processes) output'
---
Basically everytime
```bash
$ ps aux
$ ps aux | grep something
```

Process hierarchies
```bash
$ ps faux
```

Choose a process with a given pid
```bash
$ ps -p 814
```

Choose specific columns (no spaces after a comma!)
```bash
$ ps -p 814 -o %mem,%cpu
```
