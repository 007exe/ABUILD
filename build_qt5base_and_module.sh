#!/bin/bash

QT_VERSION=5.15.4

# NOTE: После сборки qt5-base следует пересобрать qt5-webkit и qt5-webengine
# WARNING: Пакет qt5-webengine собирается очень долго

MLIST="qt5-base
qt5-declarative
qt5-3d
qt5-charts
qt5-connectivity
qt5-datavis3d
qt5-gamepad
qt5-graphicaleffects
qt5-imageformats
qt5-location
qt5-lottie
qt5-multimedia
qt5-networkauth
qt5-purchasing
qt5-quick3d
qt5-quickcontrols
qt5-quickcontrols2
qt5-quicktimeline
qt5-remoteobjects
qt5-script
qt5-scxml
qt5-sensors
qt5-serialport
qt5-serialbus
qt5-speech
qt5-svg
qt5-tools
qt5-translations
qt5-virtualkeyboard
qt5-wayland
qt5-webchannel
qt5-websockets
qt5-webglplugin
qt5-x11extras
qt5-xmlpatterns
"

#qt5-webengine
#qt5-webview

CWD=~
STARTD=`pwd`

LOGFILE="$CWD/qt5-$QT_VERSION-build.log"

for i in $MLIST ; do
    echo "`date` || Сборка пакета: $i" >> $LOGFILE
    cd $STARTD/dev-qt/$i
    if mkpkg -ba -pod ~/mkpkg/packages/dev-qt -wd ~/BUILD -si -bv $QT_VERSION -bb 1; then
            echo "`date` || Пакет: $i ГОТОВ" >> $LOGFILE
            cd $STARTD
    else
            echo "`date` || ОШИБКА пакет: $i НЕ СОБРАН!!!" >> $LOGFILE
            cd $STARTD
    fi
done

echo "============================= Завершено в `date` =============================" >> $LOGFILE
