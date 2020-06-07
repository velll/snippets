---
title: 'Tracking space usage'
---
```bash
$ df -H

Filesystem      Size  Used Avail Use% Mounted on
udev            1.1G     0  1.1G   0% /dev
tmpfs           206M   21M  185M  11% /run
/dev/sda1        22G  4.4G   16G  22% /
tmpfs           1.1G     0  1.1G   0% /dev/shm
tmpfs           5.3M     0  5.3M   0% /run/lock
tmpfs           1.1G     0  1.1G   0% /sys/fs/cgroup
```

```bash
$ du -h /path/to/directory/ --max-depth=1 | sort -rh | head -20

6.2G	/
4.6G	/var
832M	/usr
603M	/lib
84M	/boot
76M	/home
...
```

Block devices
```bash
$ lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop1         7:1    0 97.1M  1 loop /snap/core/9993
loop2         7:2    0 28.1M  1 loop /snap/amazon-ssm-agent/2012
loop3         7:3    0   18M  1 loop /snap/amazon-ssm-agent/1566
loop4         7:4    0 96.6M  1 loop /snap/core/9804
nvme0n1     259:0    0    8G  0 disk
└─nvme0n1p1 259:1    0    8G  0 part /
```
