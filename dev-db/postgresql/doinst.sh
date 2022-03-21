# Добавить пользователя и группу
if ! grep -q "^pgsql:" etc/group; then
    if ! grep -q ":28:" etc/group; then
	chroot . groupadd -g 28 pgsql &>/dev/null
    else
	chroot . groupadd pgsql &>/dev/null
    fi
fi

if ! grep -q "^pgsql:" etc/passwd; then
    if ! grep -q ":28:" etc/passwd; then
	chroot . useradd -u 28 -d /var/lib/pgsql -s /bin/false -c "PostgreSQL" -g 28 pgsql &>/dev/null
    else
	chroot . useradd -d /var/lib/pgsql -s /bin/false -c "PostgreSQL" -g 28 pgsql &>/dev/null
    fi
fi

chown -R pgsql:pgsql var/log/pgsql
chown pgsql:pgsql var/lib/pgsql

# Выводит предупреждающее сообщение, если версия базы данных на диске не соответствует основной версии PostgreSQL.
  if [ -d /var/lib/postgres/data ]; then
	/usr/bin/postgresql-check-db-dir /var/lib/postgres/data || true
  fi
