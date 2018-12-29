---
title: 'Redirecting input and output'
---
- `<` takes file as INPUT
- `>` routes the OUTPUT to a file
- `>>` routes the OUTPUT to a file (append instead of rewrite)

Overwrite
```
$ echo "*.log" > .gitignore
```

Append
```
$ echo "*.log" >> .gitignore
```

Piping
```
$ ps aux | grep firefox
```
