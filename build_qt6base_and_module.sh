#!/bin/bash

QT_VERSION=6.3.0

# NOTE: После сборки qt6-base следует пересобрать qt6-webengine
# WARNING: Пакет qt6-webengine собирается очень долго

MLIST="qt6-base
qt6-shadertools
qt6-languageserver
qt6-declarative
qt6-3d
qt6-5compat
qt6-charts
qt6-connectivity
qt6-datavis3d
qt6-imageformats
qt6-lottie
qt6-multimedia
qt6-networkauth
qt6-serialport
qt6-positioning
qt6-quick3d
qt6-quicktimeline
qt6-remoteobjects
qt6-scxml
qt6-sensors
qt6-serialbus
qt6-svg
qt6-tools
qt6-translations
qt6-virtualkeyboard
qt6-wayland
qt6-websockets
qt6-webchannel
"
#qt6-webengine
#qt6-webview


CWD=~
STARTD=`pwd`

LOGFILE="$CWD/qt6-$QT_VERSION-build.log"

for i in $MLIST ; do
    echo "`date` || Сборка пакета: $i" >> $LOGFILE
    cd $STARTD/dev-qt/$i
    if mkpkg -ba -pod ~/mkpkg/packages/dev-qt -wd ~/BUILD -si -bv $QT_VERSION -bb 1; then
            DATETMP=`date`
            echo "`date` || Пакет: $i ГОТОВ" >> $LOGFILE
            cd $STARTD
    else
            DATETMP=`date`
            echo "`date` || ОШИБКА пакет: $i НЕ СОБРАН!!!" >> $LOGFILE
            cd $STARTD
    fi
done

echo "============================= Завершено в `date` =============================" >> $LOGFILE
