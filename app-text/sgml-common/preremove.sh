chroot . install-catalog --remove /etc/sgml/sgml-ent.cat \
	/usr/share/sgml/sgml-iso-entities-8879.1986/catalog
chroot . install-catalog --remove /etc/sgml/sgml-docbook.cat \
	/etc/sgml/sgml-ent.cat
