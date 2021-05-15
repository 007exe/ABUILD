if [ -r bin/bash ]; then
  mv bin/bash bin/bash.old
fi
mv bin/bash5.new bin/bash
if [ -f bin/bash.old ]; then
  rm -f bin/bash.old
fi

if [ -r bin/sh ]; then
  mv bin/sh bin/sh.old
fi
mv bin/sh.new bin/sh
if [ -f bin/sh.old ]; then
  rm -f bin/sh.old
fi


if [ ! -r etc/shells ]; then
  touch etc/shells
  chmod 644 etc/shells
fi
if fgrep "/bin/bash" etc/shells 1> /dev/null 2> /dev/null ; then
  true
else
  echo "/bin/bash" >> etc/shells
fi

