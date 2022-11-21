echo -e "\n"
echo -e "The following packages extend inxi capabilities:"
echo -e "bluez-tools: bt-adapter: -E bluetooth data (if no hciconfig)"
echo -e "bluez-utils-compat: hciconfig: -E bluetooth HCI data"
echo -e "bind: -i wlan IP"
echo -e "dmidecode: inxi -M if no sys machine data"
echo -e "file: inxi -o unmounted file system"
echo -e "freeipmi: ipmi-sensors: -s IPMI sensors"
echo -e "hddtemp: inxi -Dx show hdd temp"
echo -e "iproute2: inxi -i ip lan"
echo -e "ipmitool: -s IPMI sensors"
echo -e "kmod: inxi -Ax,-Nx module version"
echo -e "lm_sensors: inxi -s sensors output"
echo -e "mesa-utils: inxi -G glx info"
echo -e "net-tools: inxi -i ip lan-deprecated"
echo -e "perl-io-socket-ssl: -U; -w,-W; -i (if dig not installed)"
echo -e "perl-cpanel-json-xs: --output json - required for export"
echo -e "perl-json-xs: --output json - required for export (legacy)"
echo -e "perl-xml-dumper: --output xml - Crude and raw"
echo -e "sudo: inxi -Dx hddtemp-user;-o file-user"
echo -e "tree: --debugger 20,21 /sys tree"
echo -e "upower: -sx attached device battery info"
echo -e "usbutils: inxi -A usb audio;-N usb networking"
echo -e "wmctrl: -S active window manager (not all wm)"
echo -e "xorg-xdpyinfo: inxi -G multi screen resolution"
echo -e "xorg-xprop: inxi -S desktop data"
echo -e "xorg-xrandr: inxi -G single screen resolution"
echo -e " "
