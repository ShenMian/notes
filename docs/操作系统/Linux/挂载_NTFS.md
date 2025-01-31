# 挂载 NTFS

```txt
An error occurred while accessing 'DATA', the system responded: The requested operation has failed: Error mounting /dev/nvme1n1p4 at /run/media/sms/DATA: wrong fs type, bad option, bad superblock on /dev/nvme1n1p4, missing codepage or helper program, or other error
```

```sh
sudo mkdir /run/media/sms/DATA
sudo mount -t ntfs /dev/nvme1n1p4 /run/media/sms/DATA
```
