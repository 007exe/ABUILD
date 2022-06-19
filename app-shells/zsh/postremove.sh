sed -i -r '/^(\/usr)?\/bin\/zsh$/d' etc/shells

# Удаляем пустые строки
sed -i '/^$/d' etc/shells
