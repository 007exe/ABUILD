if [ -d /var/lib/dhcpcd ]; then
        chown root:root /var/lib/dhcpcd
        chmod 0750 /var/lib/dhcpcd
fi
