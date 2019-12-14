---
title: 'iptables: saving and restoring rules'
---
Exporting current set of iptables rules to file and importing back from a file.

## Save current configuration

Save current configuration
```
# iptables-save > /home/username/iptables-default.txt
```

## Apply the rules
```
# cp iptables-default.txt iptables-rules.txt
# iptables-restore < iptables-rules.txt
```
