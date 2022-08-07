#!/sbin/runscript
# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/teamspeak-server-bin/files/teamspeak3-server.rc,v 1.4 2010/09/11 16:01:50 trapni Exp $

ARCH=`arch`

depend() {
	need net
	use mysql
}

start() {
	ebegin "Starting TeamSpeak 3 Server"

	# ensure, that the TS3-server finds all custom supplied shared objects on startup.
	export LD_LIBRARY_PATH="/opt/teamspeak3-server:$LD_LIBRARY_PATH"

	# temporay fix for EPERM bug (we still leave it here to make sure it is *really* not there)
	rm -f /dev/shm/7gbhujb54g8z9hu43jre8

	start-stop-daemon --start --quiet --background \
		--pidfile "/var/run/teamspeak3-server/server.pid" --make-pidfile \
		--chuid "teamspeak3" --chdir "/opt/teamspeak3-server" \
		--exec "/usr/bin/teamspeak3-server"

	eend $?
}

stop() {
	ebegin "Stopping TeamSpeak Server"

	start-stop-daemon --stop --quiet \
		--pidfile "/var/run/teamspeak3-server/server.pid"

    # Yes, this is really neccessary >.<
    if [ $ARCH == "x86_64" ]; then
        KARCH="amd64"
    else
        KARCH="x86"
    fi
    killall ts3server_linux_$KARCH

	eend $?
}

restart() {
	svc_stop
	sleep 3
	svc_start
}
