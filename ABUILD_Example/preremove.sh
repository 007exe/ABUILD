# NOTE: Данный скрипт выполняется перед удалением файлов пакета из файловой системы, также он выполняется и в процессе обновления пакета.
# Порядок выполнения скриптов:
# Установка пакета. doinst.sh
# Обновление пакета. preremove.sh => postremove.sh => doinst.sh
# Удаление пакета. preremove.sh => postremove.sh
