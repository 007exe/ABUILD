chroot . usr/bin/groupadd -r lightdm 2>/dev/null
chroot . usr/bin/useradd lightdm -r -g lightdm -G lightdm -d /var/run/lightdm -s /sbin/nologin 2>/dev/null
