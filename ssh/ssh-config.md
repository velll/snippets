---
title: 'SSH configuration file format'
---
```
Host *
ForwardAgent yes

# Parameters for specific host
Host <name>                # name for ssh command ($ ssh <name>)
HostName <hostname>        # IP or URL
User <username>            # username on the remote machine
# Port forwarding
LocalForward <local-port> 127.0.0.1:<remote-port>

# Specific key to use for this connection
IdentityFile ~/.ssh/id_rsa.github
```
