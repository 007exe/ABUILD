#!/bin/sh

# Проверяем существует ли файл last_installed_files
if [ -f var/mpkg/last_installed_files ]; then
	# Проверяем были ли установлены модули ядра
	TEMPs=`cat var/mpkg/last_installed_files | grep '^usr/lib/modules/.' | head -n 1 | sed 's:^usr/lib/modules/::g' | sed 's:/.*::g'`
	if [ "$TEMPs" != "" ] ; then
		if [ -f boot/initrd-linux.img ] ; then
			echo "===> Сохраняю текущий initrd..."
			mv boot/initrd-linux.img boot/initrd-linux-fallback.img
		fi
		echo "===> Запрашиваю установленную версию ядра..."
		KERNEL_VER=`sqlite3 var/mpkg/packages.db "select package_version from packages where package_name='kernel' and package_installed='1';"`
		echo "===> Собираю initrd для ядра $KERNEL_VER"
		chroot . make-initrd -k $KERNEL_VER
	else
		exit 0
	fi
fi