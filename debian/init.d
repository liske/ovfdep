#!/bin/sh
### BEGIN INIT INFO
# Provides:          ovfdep
# Required-Start:    $local_fs
# Should-Start:      vmware-tools
# Required-Stop:     
# Default-Start:     2 3 4 5
# Default-Stop:      
# Short-Description: VMware OVF deployment helper
# Description:       The VMware OVF deployment helper configure basic
#                    system properties like hostname, setup an initial
#                    root password, generate ssh host keys etc.
# X-Interactive:     true
# X-Start-Before:    $network
### END INIT INFO

# Author: Thomas Liske <thomas@fiasko-nw.net>

# Do NOT "set -e"

# PATH should only include /usr/* if it runs after the mountnfs.sh script
PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="ovfdep"
NAME=ovfdep
BIN=/usr/sbin/ovfdep
SCRIPTNAME=/etc/init.d/$NAME

# Exit if the package is not installed
[ -x "$BIN" ] || exit 0

# Load the VERBOSE setting and other rcS variables
. /lib/init/vars.sh

# Define LSB log_* functions.
# Depend on lsb-base (>= 3.2-14) to ensure that this file is present
# and status_of_proc is working.
. /lib/lsb/init-functions

#
# Function that starts the daemon/service
#
do_start()
{
	"$BIN" startup
	return 0
}

#
# Function that stops the daemon/service
#
do_stop()
{
	return 1
}

case "$1" in
  start)
	[ "$VERBOSE" != no ] && log_daemon_msg "Starting $DESC" "$NAME"
	do_start
	case "$?" in
		0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
		2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
	esac
	;;
  stop)
	[ "$VERBOSE" != no ] && log_daemon_msg "Stopping $DESC" "$NAME"
	do_stop
	case "$?" in
		0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
		2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
	esac
	;;
  status)
	exit 0
	;;
  *)
	echo "Usage: $SCRIPTNAME {start}" >&2
	exit 3
	;;
esac

:
