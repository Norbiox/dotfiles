#!/bin/sh
set -e
xset s off dpms 0 10 0
i3lock --color=282C34 --ignore-empty-password --show-failed-attempts --nofork
xset s off -dpms
