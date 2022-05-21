#!/bin/bash

QT_VERSION=5.15.4

LIST="qt5-base
qt5-declarative
qt5-tools
qt5-multimedia
qt5-quickcontrols2
qt5-sensors
qt5-svg
qt5-webchannel
qt5-websockets
qt5-graphicaleffects
qt5-remoteobjects
qt5-serialport
qt5-x11extras
qt5-connectivity
qt5-location
qt5-quickcontrols
qt5-script
qt5-speech
qt5-wayland
qt5-xmlpatterns
qt5-quick3d
"
# qt5-webengine

CWD=~
STARTD=`pwd`

LOGFILE="$CWD/qt5-$QT_VERSION-build.log"

for i in $LIST ; do
	echo "Сборка: $i" >> $LOGFILE
        cd $STARTD/dev-qt/$i
	if mkpkg -pod ~/mkpkg/packages/dev-qt -si -bv $QT_VERSION -bb 1; then
		echo "$i: ГОТОВ" >> $LOGFILE
                cd $STARTD
	else
		echo "$i: ОШИБКА!" >> $LOGFILE
                cd $STARTD
	fi
done
