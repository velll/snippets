---
title: 'Git PS1 in command prompt'
---
```bash
export GIT_PS1_SHOWDIRTYSTATE="true"
PS1='\[\e[0;33m\]\[\e[0;32m\]\u@\h \[\e[0;36m\]\w \[\e[0;33m\]$(__git_ps1 "[%s] ")\[\e[0;36m\]\$ \[\e[0;32m\]\[\e[0m\]'
```
