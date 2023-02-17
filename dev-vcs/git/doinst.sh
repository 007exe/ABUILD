echo -e " "
echo -e "The following packages extend git capabilities:"
echo -e "tk: gitk and git gui"
echo -e "perl-libwww: git svn"
echo -e "perl-term-readkey: git svn and interactive.singlekey setting"
echo -e "perl-io-socket-ssl: git send-email TLS support"
echo -e "perl-authen-sasl: git send-email TLS support"
echo -e "perl-mediawiki-api: git mediawiki support"
echo -e "perl-datetime-format-iso8601: git mediawiki support"
echo -e "perl-lwp-protocol-https: git mediawiki https support"
echo -e "perl-cgi: gitweb (web interface) support"
echo -e "python: git svn & git p4"
echo -e "subversion: git svn"
echo -e "libsecret: libsecret credential helper"
echo -e " "

# Устанавливаем git-shell допустимой оболочкой
grep -qe '^/bin/git-shell$' etc/shells || echo '/bin/git-shell' >> etc/shells
grep -qe '^/usr/bin/git-shell$' etc/shells || echo '/usr/bin/git-shell' >> etc/shells

# Удаляем пустые строки
sed -i '/^$/d' etc/shells
