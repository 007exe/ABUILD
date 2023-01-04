#!/bin/sh
config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # Если нет конфигурационного файла с таким именем, скопируйте его заново:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # удалить лишнюю копию
    rm $NEW
  fi
  # В противном случае мы оставляем новую копию на рассмотрение администратора...
}

# Убедимся, что добавлены все новые записи в passwd/shadow/group:
if [ -r etc/passwd -a -r etc/passwd.new ]; then
  cat etc/passwd.new | while read line ; do
    if ! grep -q "^$(echo $line | cut -f 1 -d :):" etc/passwd ; then
      echo $line >> etc/passwd
    fi
  done
fi
if [ -r etc/shadow -a -r etc/shadow.new ]; then
  cat etc/shadow.new | while read line ; do
    if ! grep -q "^$(echo $line | cut -f 1 -d :):" etc/shadow ; then
      echo $line >> etc/shadow
    fi
  done
fi
if [ -r etc/group -a -r etc/group.new ]; then
  cat etc/group.new | while read line ; do
    if ! grep -q "^$(echo $line | cut -f 1 -d :):" etc/group ; then
      echo $line >> etc/group
    fi
  done
fi

config etc/mtab.new
config etc/motd.new
config etc/group.new
config etc/csh.login.new
config etc/ld.so.conf.new
config etc/profile.new
config etc/hosts.new
config etc/shadow.new
config etc/passwd.new
config etc/printcap.new
config etc/networks.new
config etc/gshadow.new
config etc/issue.new
config etc/securetty.new
config etc/shells.new
config etc/services.new
config etc/issue.net.new
config etc/nsswitch.conf.new
config etc/profile.d/lang.csh.new
config etc/profile.d/lang.sh.new
config var/log/lastlog.new
config var/log/wtmp.new
config var/run/utmp.new

if [ -r etc/ld.so.conf.new -a -r etc/ld.so.conf ]; then
  # Ensure that ld.so.conf contains the minimal set of paths:
  # (eliminate ld.so.conf.d line when adding paths to avoid repeats)
  cat etc/ld.so.conf | grep -v ld.so.conf.d | while read pathline ; do
    if ! grep "^${pathline}$" etc/ld.so.conf.new 1> /dev/null 2> /dev/null ; then
      echo "$pathline" >> etc/ld.so.conf.new
    fi
  done
  cp etc/ld.so.conf.new etc/ld.so.conf
fi

# Clean up useless non-examples:
rm -f etc/mtab.new
rm -f etc/motd.new
rm -f etc/ld.so.conf.new
rm -f etc/hosts.new
rm -f etc/shadow.new
rm -f etc/networks.new
rm -f etc/gshadow.new
rm -f etc/shells.new
rm -f etc/printcap.new
rm -f etc/issue.new
rm -f etc/issue.net.new
rm -f etc/profile.d/lang.csh.new
rm -f etc/profile.d/lang.sh.new
rm -f var/run/utmp.new
rm -f var/log/lastlog.new
rm -f var/log/wtmp.new

# Also ensure ownerships/perms:
chown root.utmp var/run/utmp var/log/wtmp
chmod 664 var/run/utmp var/log/wtmp
chown root.shadow etc/shadow etc/gshadow
chmod 640 etc/shadow etc/gshadow

