#!/bin/sh
set -e

systemctl start mongod pritunl
systemctl enable mongod pritunl

[ "$1" ] && exec "$@"

