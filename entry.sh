#!/bin/sh
set -e

sudo service pritunl start

[ "$1" ] && exec "$@"

