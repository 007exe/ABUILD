
## ABUILD cценарии для сборки пакетов для пакетного менеджера mpkg

### Процесс сборки пакета описывается с помощью файла, имеющего имя ABUILD.

=== Именование файлов ===

Для каждого пакета, файл должен находиться в отдельной директории, и иметь именно такое имя. Например, ваша директория с ABUILD'ами к разным пакетам должна иметь подобный вид:

<pre>
pkg1/ABUILD
    /patches
    /files
    /doinst.sh
    /preremove.sh
    /postremove.sh
pkg2/ABUILD
pkg3/ABUILD
    /patches
pkg4/ABUILD
    /files
...
</pre>

=== Дополнительные файлы ===

Кроме ABUILD, в директории могут находиться и другие файлы. Существуют три категории файлов:

* Патчи: находятся в директории patches
* Скрипты установки (doinst.sh, preremove.sh, postremove.sh): находятся на одном уровне рядом с ABUILD
* Прочие файлы: находятся в директории files

Все остальные файлы будут проигнорированы.

=== Синтаксис ABUILD ===

Строго говоря, с точки зрения общего синтаксиса ABUILD представляет из себя ни что иное, как bash-скрипт. Однако чтобы mkpkg правильно его обработал, он должен соответствовать ряду правил:

* Должны быть определены обязательные переменные (такие как имя пакета, версия, и другие)
* Должно быть описание процесса его сборки (либо указана система сборки через переменную BUILD_SYSTEM), либо определена функция build(), описывающая процесс сборки

Традиционно, принято определять обязательные переменные в начале, а функции - в конце.

Пример ABUILD:

```bach
pkgname=alsa-lib
pkgver=1.2.5.1
pkgbuild=1
arch=("auto")

shortdesc=("Config files for Advanced Linux Sound Architecture (ALSA)")
longdesc=("Advanced Linux Sound Architecture (ALSA) is a modularized architecture which supports quite a large range of ISA and PCI cards.")

tags=("libs media-libs")

source=("ftp://ftp.alsa-project.org/pub/lib/${pkgname}-${pkgver}.tar.bz2")

build_deps=("glibc")

build(){
  go_src_dir
  burn_patches
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib$LIBDIRSUFFIX \
    --without-debug
  make -j${numjobs}
  make DESTDIR=${pkgdir} install
  make DESTDIR="$pkgdir" install -C doc
  install -vDm 644 {MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
```
Стандартные переменные, макпрсы и опции

Переменные | Краткое описание.
:----------| :--------------------
${srcache} | Каталог кеша исходников.
${srcdir}  | Рабочий каталог.
${filedir} | Каталог с дополнительными файлами files.
go_src_dir | Макрос означающий перейти в ${srcdir}/Распаковынный архив исходников.
remove_libtool_files=OFF | По умолчанию равен ON (Включён). Удалить файлы libtool (*.la) из пакета 
strict_version=1 | По умолчанию выключен, равен 0 (Выключено). Опция задаёт жёсткую версию из pkgver в противном случае при использовании системы контроля версии (git, sun...) к версии пакета будит добавлена префикс с датой сборки 1.5_git20220110.

***

Группы пакетов.      | Краткое описание.
:--------------------| :--------------------
ABUILD_Example       | Пример оформления пакета.
Agilia_utils         | Система управления пакетами и сопутствующие утилиты.
app-accessibility    | Пакеты, которые помогают с расширенными возможностями (например, программы чтения с экрана).
app-admin            | Неосновные приложения, относящиеся к системному администрированию.
app-antivirus        | Антивирусное программное обеспечение.
app-arch             | Инструменты для архивирования, сжатия и распаковки файлов или групп файлов.
app-cdr              | Инструменты для выполнения резервного копирования данных.
app-crypt            | Криптографическое программное обеспечение.
app-dicts            | Пакеты словарей и списки слов.
app-doc              | Разная документаця.
app-editors          | Текстовые редакторы.
app-emulation        | Программы для эмуляции
app-i18n             | Пакеты, связанные с интернационализацией (поддержка других языков).
app-misc             | Различные приложения, которые не принадлежат ни к одной из групп app.
app-office           | Оффисные программы такие как текстовый редактор, электронные таблицы, презентации.
app-pda              | Программы для работы с персональными цифровыми помощниками или портативными компьютерами.
app-shells           | Коммандные оболочки и их расширения.
app-text             | Инструменты для работы с текстовыми файлами.
dev-cpp              | Библиотеки и утилиты, относящиеся к языку программирования C++.
dev-db               | Библиотеки и утилиты для программирования, связанного с базами данных.
dev-embedded         | Библиотеки и утилиты, относящиеся к встроенному программированию.
dev-java             | Библиотеки и утилиты, относящиеся к языку программирования Java.
dev-lang             | Различные реализации языков программирования и связанные с ними инструменты.
dev-libs             | Библиотеки для разных программ.
dev-ml               | Библиотеки и утилиты, относящиеся к языку программирования ML.
dev-perl             | Библиотеки и утилиты, относящиеся к языку программирования Perl.
dev-python           | Модули языка Python.
dev-qt               | Модулей фреймворка Qt и непосредственно связанные библиотеки и приложения для Qt.
dev-ruby             | Библиотеки и утилиты, относящиеся к языку программирования Ruby.
dev-scheme           | Библиотеки и утилиты, относящиеся к языку программирования Scheme.
dev-tcltk            | Библиотеки и инструменты, связанные с TCL и TK.
dev-util             | Различные утилиты для разработки.
dev-vcs              | Утилиты, ориентированные на контроль версий.
gnome-base           | Основные пакеты GNOME.
gnome-extra          | Дополнительные неосновные пакеты GNOME.
gui-libs             | Разные библиотеки, которые поддерживают различные оконные менеджеры.
kde-apps             | Пакеты, выпущенные KDE как часть KDE Applications.
kde-frameworks       | Основные пакеты KDE Frameworks.
kde-misc             | Различные пакеты KDE.
kde-plasma           | Основные пакеты KDE Plasma
lxde-base            | Основные пакеты для LXDE, облегченной среды рабочего стола X11.
media-fonts          | Шрифты.
media-gfx            | Пакеты, связанные с графикой.
media-libs           | Мультимедиа библиотеки.
media-plugins        | Плагины для различных медиа-приложений.
media-sound          | Аудиоприложения.
media-tv             | Приложения, связанные с телевидением.
media-video          | Приложения, связанные с видео.
net-analyzer         | Программное обеспечение для анализа сети.
net-dialup           | Сетевое программное обеспечение, связанное с коммутируемым доступом.
net-dns              | Программное обеспечение, связанное с DNS (службой доменных имен).
net-firewall         | Программное обеспечение сетевого брандмауэра.
net-fs               | Пакеты сетевой файловой системы.
net-ftp              | Программное обеспечение FTP (протокол передачи файлов).
net-libs             | Библиотеки, связанные с сетью.
net-misc             | Различные сетевые инструменты и утилиты.
net-p2p              | Одноранговые сетевые приложения.
net-print            | Пакеты сетевой печати.
net-wireless         | Программное обеспечение и служебные программы для беспроводных сетей.
sci-electronics      | Программы связанные с аппаратной разработкой.
sci-geosciences      | Программное обеспечение, связанное с науками о Земле.
sci-libs             | Различные научные библиотеки.
sys-apps             | Различные базовые системные приложения.
sys-auth             | Приложения и библиотеки для поддержки средств аутентификации и авторизации.
sys-block            | Программы для работы с блочными устройствами.
sys-boot             | Загрузчики и связанные с ними инструменты.
sys-cluster          | Программное обеспечение, относящееся к кластерам. 
sys-devel            | Инструменты и библиотеки для разработки.
sys-firmware         | Прошивки и микрокод.
sys-fs               | Инструменты и служебные программы файловой системы. 
sys-kernel           | Инструменты, относящиеся к ядру. 
sys-libs             | Системные библиотеки.
sys-power            | Программы и утилиты для управления питанием.
sys-process          | Программы для управления процессами.
www-client           | Программы для доступа в интернет такие как веб браузеры.
x11-apps             | Приложения, распространяемые как часть X.Org X11.
x11-base             | Базовые реализации X11. 
x11-drivers          | Драйверы для сервера X11.
x11-libs             | Библиотеки X11.
x11-misc             | Различные приложения для X11.
x11-terms            | Эмуляторы терминала для сред X11.
x11-themes           | Темы и стили для приложений X11.
x11-wm               | Оконные менеджеры X11.
xfce-base            | Базовые пакеты XFCE.
xfce-extra           | Неосновные приложения XFCE.
