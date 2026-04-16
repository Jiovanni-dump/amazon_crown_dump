#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9568256:83f45c5ecb2464c8be824ccdc71113992db56db0; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8376320:cdb0d91497e0bc57891ffefcd459c7af88b05d8c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 329d4e7010d73d4e527f1473fb19e1ad04a1dc43 9566208 cdb0d91497e0bc57891ffefcd459c7af88b05d8c:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9566208 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
