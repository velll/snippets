---
title: Basic commands
order: 0
---
Global configuration
```bash
$ git config --global user.name "<name>"
$ git config --global user.email "<email>"
```

all stored in ~/.gitconfig

New repo

```bash
$ git init && touch .gitignore && git add .gitignore && git commit -a -m "Initial commit"
```
Existing repo

```bash
$ git clone <repo-url>
```

Stage
```bash
$ git add <file>
```

Stage all
```bash
$ git add .
```

Commit staged
```bash
$ git commit
$ git commit -m "Short commit message"
```

Commit all modified
```bash
$ git commit -a
```
Send to remote
```bash
$ git push
$ git push <remote> <branch>
```

Branches
```bash
$ git checkout -b <newbranch>
$ git checkout <existing-branch>
```
Merge other branch into current
```bash
$ git merge <other-branch>
```

Fetch vs pull
```bash
$ git fetch
$ git pull
```
Pull = Fetch + Merge

Bisect
```bash
$ git bisect
```
