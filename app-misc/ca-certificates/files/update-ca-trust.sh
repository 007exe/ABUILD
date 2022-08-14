#!/bin/sh

if [ -f var/mpkg/last_installed_files ] ; then
    if grep usr/share/ca-certificates/trust-source/ var/mpkg/last_installed_files; then
        echo "Rebuilding certificate stores..."
        chroot . /usr/bin/update-ca-trust
    fi
fi
