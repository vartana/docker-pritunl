#!/bin/sh
set -e

service pritunl start

[ "$1" ] && exec "$@"

