---
title: Git hooks
---
Hooks are simply scripts that git runs

List available hooks
```bash
$ ls -l .git/hooks/
```

Strip `.sample` extension and put a file with your script under `.git/hooks`
```bash
$ mv pre-commit .git/hooks
```

Pre-commit hook. Exiting with a non-zero status from this script causes the git commit command to abort before creating a commit.
```bash
#!/bin/sh
#
echo "I am pre commit!"

rubocop
yarn tslint -p .
```

Ignore hook exit status and commit anyway
```bash
$ git commit --no-verify
```
