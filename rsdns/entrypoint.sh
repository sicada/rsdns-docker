#!/bin/bash

# Start the run once job.
echo "rsdns container has started."

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /root/container.env

echo "
# Setup a cron schedule
30 * * * * /root/rsdns_wrapper.sh >> /proc/1/fd/1 2>&1
# This extra line makes it a valid cron
" >> /root/.crontab_config

crontab /root/.crontab_config

crond -f

