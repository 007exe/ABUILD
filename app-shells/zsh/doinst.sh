grep -qe '^/bin/zsh$' etc/shells || echo '/bin/zsh' >> etc/shells
grep -qe '^/usr/bin/zsh$' etc/shells || echo '/usr/bin/zsh' >> etc/shells

# Удаляем пустые строки
sed -i '/^$/d' etc/shells
