#!/bin/sh
#
# isvi server start.
#

# Make sure the progam exists
[ -f /home/embedded/examples/isvi_server ] || exit 0

export BARDYLIB=/home/embedded/bardy
export LD_LIBRARY_PATH=/home/embedded/bardy

start() {
	printf "Starting isvi_server: "
	/home/embedded/examples/isvi_server /home/embedded/examples &
	touch /var/lock/isvi_server
	echo "OK"
}
stop() {
	printf "Stopping isvi_server: "
	killall isvi_server
	rm -f /var/lock/isvi_server
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
