# Если группы netdev и avahi не существуют, добавьте их
if ! grep "^avahi:" etc/group >/dev/null 2>&1; then
  echo "avahi:x:85:" >>etc/group
fi
if ! grep "^avahi:" etc/gshadow >/dev/null 2>&1; then
  echo "avahi:*::" >>etc/gshadow
fi
if ! grep "^avahi-autoipd:" etc/group >/dev/null 2>&1; then
  echo "avahi-autoipd:x:88:" >>etc/group
fi
if ! grep "^avahi-autoipd:" etc/gshadow >/dev/null 2>&1; then
  echo "avahi-autoipd:*::" >>etc/gshadow
fi

# Если пользователя avahi-autoipd не существует, добавьте его
if ! grep "^avahi-autoipd:" etc/passwd >/dev/null 2>&1; then
  echo "avahi-autoipd:x:88:88:avahi-autoipd:/etc/avahi:/bin/false" >>etc/passwd
fi
if ! grep "^avahi-autoipd:" etc/shadow >/dev/null 2>&1; then
  echo "avahi-autoipd:*:9797:0:::::" >>etc/shadow
fi

# Если пользователя avahi не существует, добавляем его
if ! grep "^avahi:" etc/passwd >/dev/null 2>&1; then
  echo "avahi:x:85:85:avahi:/etc/avahi:/bin/false" >>etc/passwd
fi
if ! grep "^avahi:" etc/shadow >/dev/null 2>&1; then
  echo "avahi:*:9797:0:::::" >>etc/shadow
fi

echo -e "\n"
echo -e "The following packages extend avahi capabilities:"
echo -e "gtk3: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc"
echo -e "qt5-base: qt5 bindings"
echo -e "libevent: libevent bindings"
echo -e "nss-mdns: NSS support for mDNS"
echo -e "python-twisted: avahi-bookmarks"
echo -e "python-gobject: avahi-bookmarks, avahi-discover"
echo -e "python-dbus: avahi-bookmarks, avahi-discover"
echo -e " "
