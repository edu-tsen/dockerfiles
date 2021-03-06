#!/bin/bash
set -e

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	chown -R redis .
	exec su redis -s /bin/sh -c "$@"
fi

exec "$@"
