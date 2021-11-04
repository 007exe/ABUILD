# Make sure the polkitd user and group exist:
if ! grep -q "^polkitd:" etc/passwd ; then
  echo "polkitd:x:87:87:PolicyKit daemon owner:/var/lib/polkit:/bin/false" >> etc/passwd
fi
if ! grep -q "^polkitd:" etc/group ; then
  echo "polkitd:x:87:" >> etc/group
fi

