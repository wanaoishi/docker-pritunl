#!/bin/sh
set -e

[ -d /dev/net ] ||
    mkdir -p /dev/net
[ -c /dev/net/tun ] ||
    mknod /dev/net/tun c 10 200

touch /var/log/pritunl.log

touch /var/run/pritunl.pid

/bin/rm /var/run/pritunl.pid

/usr/bin/pritunl --start --pidfile /var/run/pritunl.pid

[ "$1" ] && exec "$@"

