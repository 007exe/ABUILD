
## ABUILD


### Cценарии для сборки пакетов для пакетного менеджера mpkg.

Именование файлов

Для каждого пакета, файл должен находиться в отдельной директории, и иметь именно такое имя. Например, ваша директория с ABUILD'ами к разным пакетам должна иметь подобный вид:

<pre>
pkgname1/ABUILD
    /patches
    /files
    /doinst.sh
    /preremove.sh
    /postremove.sh
pkgname2/ABUILD
pkgname3/ABUILD
    /patches
pkgname4/ABUILD
    /files
...
</pre>

***

Группы пакетов       | Краткое описание.
:--------------------| :--------------------
ABUILD-example       | Пример оформления пакета.
agilia-utils         | Система управления пакетами и сопутствующие утилиты.
app-accessibility    | Пакеты, которые помогают с расширенными возможностями (например, программы чтения с экрана).
app-admin            | Неосновные приложения, относящиеся к системному администрированию.
app-antivirus        | Антивирусное программное обеспечение.
app-arch             | Инструменты для архивирования, сжатия и распаковки файлов или групп файлов.
app-cdr              | Инструменты для выполнения резервного копирования данных.
app-crypt            | Криптографическое программное обеспечение.
app-dicts            | Пакеты словарей и списки слов.
app-doc              | Разная документаця.
app-editors          | Текстовые редакторы.
app-emulation        | Программы для эмуляции.
app-i18n             | Пакеты, связанные с интернационализацией (поддержка других языков).
app-misc             | Различные приложения, которые не принадлежат ни к одной из групп app.
app-mobilephone      | Приложения для мобильных телефонов.
app-office           | Оффисные программы такие как текстовый редактор, электронные таблицы, презентации.
app-pda              | Программы для работы с персональными цифровыми помощниками или портативными компьютерами.
app-shells           | Коммандные оболочки и их расширения.
app-text             | Инструменты для работы с текстовыми файлами.
cinnamon-apps        | Приложения Сinnamon.
cinnamon-base        | Основые пакеты Сinnamon.
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
cinnamon             | Основные пакеты Cinnamon.
cinnamon-extra       | Дополнительные пакеты Cinnamon.
gnome-base           | Основные пакеты GNOME.
gnome-extra          | Дополнительные неосновные пакеты GNOME.
gnome-libs           | Библиотеки GNOME.
gui-libs             | Разные библиотеки, которые поддерживают различные оконные менеджеры.
kde-apps             | Пакеты, выпущенные KDE как часть KDE Applications.
kde-frameworks       | Основные пакеты KDE Frameworks.
kde-games            | Коллекция игр KDE.
kde-libs             | Библиотеки KDE.
kde-misc             | Различные пакеты KDE.
kde-plasma           | Основные пакеты KDE Plasma
lxde-base            | Основные пакеты для LXDE, облегченной среды рабочего стола X11.
lxde-libs            | Библиотеки LXDE.
lxqt-base            | Основные пакеты LXQT.
lxqt-libs            | Бибилиотеки LXQT.
mate-base            | Основные пакеты MATE.
mate-extra           | Дополнительные пакеты для среды MATE.
mate-libs            | Библиотеки MATE. 
media-fonts          | Шрифты.
media-gfx            | Пакеты, связанные с графикой.
media-libs           | Мультимедиа библиотеки.
media-plugins        | Плагины для различных медиа-приложений.
media-sound          | Аудиоприложения.
media-tv             | Приложения, связанные с телевидением.
media-video          | Приложения, связанные с видео.
meta-pkg             | Мета-пакет является пустым и существует лишь для связывания пакетов при помощи зависимостей. Мета-пакет позволяет одновременно устанавливать или удалять несколько связанных пакетов.
net-analyzer         | Программное обеспечение для анализа сети.
net-dialup           | Сетевое программное обеспечение, связанное с коммутируемым доступом.
net-dns              | Программное обеспечение, связанное с DNS (службой доменных имен).
net-firewall         | Программное обеспечение сетевого брандмауэра.
net-fs               | Пакеты сетевой файловой системы.
net-im               | Программное для обмена мгновенными сообщениями.
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
x11-plugins          | Плагины для различных программ.
x11-terms            | Эмуляторы терминала для сред X11.
x11-themes           | Темы и стили для приложений X11.
x11-wm               | Оконные менеджеры X11.
xfce-base            | Базовые пакеты XFCE.
xfce-libs            | Библиотеки XFCE.
xfce-extra           | Неосновные приложения XFCE.
