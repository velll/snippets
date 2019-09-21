---
title: 'Create and manage users'
---
```
# adduser username
```

```
# passwd username
```

# Disable ssh access for the root user
```
# vim /etc/ssh/sshd_config
```

Go to the *Authentication* section.

```
# Authentication:
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes
```

Replace the yes with no on the line PermitRootLogin and restart SSH service.

```
# /etc/init.d/ssh restart
```
