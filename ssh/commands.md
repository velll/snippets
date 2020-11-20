---
title: 'Basic commands'
---
Generating new keys
```bash
$ ssh-keygen -t rsa -b 1024
```

Connect
```
ssh <host>

ssh <username>@<host>
```

Connect and forward ports
```
ssh -L <local-port>:localhost:<remote-port> <host>
```

Setting up tunnels without a terminal
```
-nNT
```

Choose specific key
```
ssh -i ~/.ssh/this-particular-key <username>@<host>
```
