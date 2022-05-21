#!/bin/bash

KF5_VERSION=5.94.0

LIST="
extra-cmake-modules
solid
ki18n
karchive
kdoctools
kwindowsystem
kconfig
kcoreaddons
knotifications
kauth
kcodecs
kguiaddons
kwidgetsaddons
kconfigwidgets
kitemviews
kiconthemes
kdbusaddons
kservice
kwallet
kjobwidgets
kcrash
kglobalaccel
kxmlgui
kbookmarks
kcompletion
sonnet
ktextwidgets
kded
kio
kparts
kidletime
kfilemetadata
baloo
kdesignerplugin
kunitconversion
kitemmodels
kemoticons
kdelibs4support
kpackage
kdeclarative
kcmutils
attica
syndication
knewstuff
kactivities
kwayland
kirigami2
plasma-framework
threadweaver
krunner
purpose
knotifyconfig
syntax-highlighting
ktexteditor
kdnssd
kimageformats
kplotting
networkmanager-qt
kpty
kdesu
frameworkintegration
kinit
kdewebkit
modemmanager-qt
kpeople
kxmlrpcclient
bluez-qt
breeze-icons
oxygen-icons
kactivities-stats
prison
qqc2-desktop-style
kjs
khtml
kjsembed
kmediaplayer
kross
kholidays
kcalendarcore
kcontacts
kquickcharts
kdav
kapidox"

CWD=~
STARTD=`pwd`

LOGFILE="$CWD/kf5-$KF5_VERSION-build.log"

for i in $LIST ; do
	echo "Сборка: $i" >> $LOGFILE
        cd $STARTD/kde-frameworks/$i
	if mkpkg -pod ~/mkpkg/packages/kde-frameworks -si -bv $KF5_VERSION -bb 1; then
		echo "$i: ГОТОВ" >> $LOGFILE
                cd $STARTD
	else
		echo "$i: ОШИБКА!" >> $LOGFILE
                cd $STARTD
	fi
done
