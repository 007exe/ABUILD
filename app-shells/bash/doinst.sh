if [ -r usr/bin/bash ]; then
  mv usr/bin/bash usr/bin/bash.old
fi
mv usr/bin/bash5.new usr/bin/bash
if [ -f usr/bin/bash.old ]; then
  rm -f usr/bin/bash.old
fi

if [ -r usr/bin/sh ]; then
  mv usr/bin/sh use/bin/sh.old
fi
mv usr/bin/sh.new usr/bin/sh
if [ -f usr/bin/sh.old ]; then
  rm -f usr/bin/sh.old
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
