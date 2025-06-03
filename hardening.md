## Disable Elevated Process Dump on error

```sh
echo 0 > /proc/sys/fs/suid_dumpable
```
