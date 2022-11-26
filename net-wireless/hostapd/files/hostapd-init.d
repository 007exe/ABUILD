#!/usr/bin/openrc-run

opts="start stop reload"

depend() {
	local myneeds=
	for iface in ${INTERFACES}; do
		myneeds="${myneeds} net.${iface}"
	done

	[ -n "${myneeds}" ] && need ${myneeds}
	use logger
}

checkconfig() {
	local file

	for file in ${CONFIGS}; do
		if [ ! -r "${file}" ]; then
			eerror "hostapd configuration file (${CONFIG}) not found"
			return 1
		fi
	done
}

start() {
	checkconfig || return 1

	ebegin "Starting ${SVCNAME}"
	start-stop-daemon --start --exec /usr/bin/hostapd \
		-- -B ${OPTIONS} ${CONFIGS}
	eend $?
}

stop() {
	ebegin "Stopping ${SVCNAME}"
	start-stop-daemon --stop --exec /usr/bin/hostapd
	eend $?
}

reload() {
	checkconfig || return 1

	ebegin "Reloading ${SVCNAME} configuration"
	kill -HUP $(pidof /usr/bin/hostapd) > /dev/null 2>&1
	eend $?
}
