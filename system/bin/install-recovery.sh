#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9566208:dbf8f0742712f2e82425ddd48cfb38243578cbab; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8374272:215259d276b9a88520712c9a96efd1b9aefcc825 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 42861f95949a7057d92d2f5fd5614b29cc905e5c 9564160 215259d276b9a88520712c9a96efd1b9aefcc825:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9564160 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
