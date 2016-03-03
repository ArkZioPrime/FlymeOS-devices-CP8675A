#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 20895744 bc1dec0a36e82954d7f9bb73594fd802f9cb64a6 17905664 5d2142d78d3ee371e9a554b52e03f0dbadee5905
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:20895744:bc1dec0a36e82954d7f9bb73594fd802f9cb64a6; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:17905664:5d2142d78d3ee371e9a554b52e03f0dbadee5905 EMMC:/dev/block/bootdevice/by-name/recovery bc1dec0a36e82954d7f9bb73594fd802f9cb64a6 20895744 5d2142d78d3ee371e9a554b52e03f0dbadee5905:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
