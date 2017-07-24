#!/bin/sh
#
# gipcy        load ipcdrv
#

# Make sure the ipcdrv.ko exists
[ -f /home/embedded/drivers/ipcdrv.ko ] || exit 0

start() {
	printf "Starting ipcdrv: "
	chmod 777 /dev/shm
	rm -fv /dev/shm/*
	/sbin/insmod /home/embedded/drivers/ipcdrv.ko $* || exit 1
	chmod -v 666 /dev/ipc_driver
	echo "OK"
}
stop() {
	printf "Stopping ipcdrv: "
	/sbin/rmmod ipcdrv
	echo "OK"
}
restart() {
	stop
	start
}

case "$1" in
  start)
	start
	;;
  stop)
	stop
	;;
  restart|reload)
	restart
	;;
  *)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?
