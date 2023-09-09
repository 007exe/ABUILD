echo -e "\n"
echo -e "syslinux package note:"
echo -e "To use syslinux as the default bootloader, run /usr/bin/syslinux-install_update -i -a -m and edit /boot/syslinux/syslinux.cfg"
echo -e " "
echo -e "The following packages extend syslinux capabilities:"
echo -e "perl-crypt-passwdmd5: For md5pass"
echo -e "perl-digest-sha1: For sha1pass"
echo -e "mtools: For mkdiskimage and syslinux support"
echo -e "gptfdisk: For GPT support"
echo -e "util-linux: For isohybrid"
echo -e "efibootmgr: For EFI support"
echo -e "dosfstools: For EFI support"
echo -e "\n"

# Авто обновление syslinux
usr/bin/syslinux-install_update -s
