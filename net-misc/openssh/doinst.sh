
# Если пользователя или группы sshd не существует то создаём их:

if ! grep -q "^sshd:" etc/passwd ; then
  echo "sshd:x:33:33:sshd:/:" >> etc/passwd
fi

if ! grep -q "^sshd:" etc/group ; then
  echo "sshd::33:sshd" >> etc/group
fi

if ! grep -q "^sshd:" etc/shadow ; then
  echo "sshd:*:9797:0:::::" >> etc/shadow
fi

# Если файл btmp не существует то создадим его для хранения ошибок входа:
if [ ! -r var/log/btmp ]; then
  ( cd var/log ; umask 077 ; touch btmp )
fi

