# /etc/conf.d/distccd: config file for /etc/init.d/distccd

DISTCCD_OPTS=""

# Исполняемый файл distccd
DISTCCD_EXEC="/usr/bin/distccd"

# Дополнительные параметры
# Порт по умолчанию — 3632.
DISTCCD_OPTS="${DISTCCD_OPTS} --port 3632"

# Журнал
# Здесь можете изменить некоторые параметры ведения журнала:
# --log-file FILE
# --log-level LEVEL  [critical,error,warning, notice, info, debug]
#
# Leaving --log-file blank will log to syslog
# example: --log-file /dev/null --log-level warning
# example: --log-level critical

DISTCCD_OPTS="${DISTCCD_OPTS} --log-level critical"

# SECURITY NOTICE:
# НАСТОЯТЕЛЬНО рекомендуется использовать опцию --listen для повышения безопасности.
# Вы можете указать IP-адрес для разрешения подключений или маску CIDR.
# --listen accepts only a single IP
# --allow is now mandatory as of distcc-2.18.
# example:  --allow 192.168.0.0/24
# example:  --allow 192.168.0.5 --allow 192.168.0.150
# example:  --listen 192.168.0.2
#DISTCCD_OPTS="${DISTCCD_OPTS} --listen 192.168.0.2"
DISTCCD_OPTS="${DISTCCD_OPTS} --allow 192.168.0.0/24"

# set this for niceness
# Default is 15
DISTCCD_OPTS="${DISTCCD_OPTS} -N 15"

# По умолчанию distccd хранит временные файлы в /tmp.
# Обязательно дайте пользователю distcc разрешение на запись в указанный TMPDIR.
#TMPDIR="/tmp"
