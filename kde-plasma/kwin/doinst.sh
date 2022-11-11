echo -e "\n"
echo -e "The following packages extend kwin capabilities:"
echo -e "maliit-keyboard: virtual keyboard for kwin-wayland"
echo -e " "

chroot . setcap CAP_SYS_NICE=+ep /usr/bin/kwin_wayland
