# TPM

```sh
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=7 /dev/nvme1n1p2
```

```sh title="/etc/cmdline.d/root.conf"
rd.luks.name=<UUID>=root rd.luks.options=tpm2-device=auto root=/dev/mapper/root rootflags=subvol=@ rw
```

```conf title="/etc/mkinitcpio.conf"
HOOKS=(base systemd autodetect microcode modconf kms keyboard sd-vconsole block sd-encrypt filesystems fsck)
```

```sh
sudo mkinitcpio -P
```
