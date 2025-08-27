1. Create a separate partition with the nodev, nosuid, and noexec options set for /tmp
```
mkdir /tmp
mount -o nodev,nosuid,noexec /dev/sdXn /tmp
echo "/dev/sdXn /tmp ext4 defaults,nodev,nosuid,noexec 0 0" >> /etc/fstab

```
The command above with create a folder, attach a mount, and then mount the directory onto the mount upon restart each time. 
	-o : configures mount options. 
		- nodev : prevents creation/interpretation of device files on that file system.
		- nosuid : ignores SUID/SGID bits of executables, to ensure executables run with the users privelege access.
		- noexec : Prevents execution of binaries on the file system, therefore strictly for storing files (logs).
		- remount : 


Create separate partitions for /var, /var/log, /var/log/audit, and /home
```

```
Bind mount /var/tmp to /tmp
```

```
Set nodev option to /home
```

```
Set nodev, nosuid, and noexec options on /dev/shm
```

```
Set sticky bit on all world-writable directories.
```

```