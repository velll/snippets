---
title: 'Authorizing SSH keys'
---

Log in using login/password and authorize your key
```bash
ssh-copy-id -i ~/.ssh/whatever-key user@host
```

Manually copy key. Make sure you obtained **public key**.
```bash
cat id_dsa.pub >> .ssh/authorized_keys
```
**Never** copy contents of a file starting with `-----BEGIN RSA PRIVATE KEY-----`.
