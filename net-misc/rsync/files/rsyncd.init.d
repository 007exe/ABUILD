#!/usr/bin/openrc-run

command="/usr/bin/rsync"
command_args="--daemon ${RSYNC_OPTS}"
pidfile="/var/run/${SVCNAME}.pid"

depend() {
	use net
}
