
# Создаём резервную копию init на случай сбоя
if [ -r usr/bin/init ] ; then
	mv usr/bin/init usr/bin/init.old
fi

mv usr/bin/init.new usr/bin/init

if [ ! -r var/log/btmp ] ; then
	( cd var/log && umask 077 && touch btmp )
fi

# На всякий случий перезапускаем init
if [ "`pwd`" = "/" ] ; then
	/usr/bin/init u
fi
