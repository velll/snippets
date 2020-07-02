---
title: Squash commits / rebase
---
Interactive mode
```bash
$ git rebase -i
```
Leave the first commit as `pick` and change `pick` to `squash` starting from the second one.
```
pick 7cf00241 Incredible new feature
squash 78420cf1 Some minor fixes
squash 55eecd32 Review fixes
squash fd5aed2b Fix formatting
```
