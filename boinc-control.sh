#!/bin/bash

CONFIG=$1

if [[ "$(whoami)" != root ]]; then
	echo "Only user root can run this script."
	exit 1
fi

if test -f "$CONFIG"; then
	echo "Setting BOINC to run with config found at" $CONFIG
	cp $CONFIG /etc/boinc-client/global_prefs_override.xml
	cd /etc/boinc-client
	boinccmd --read_global_prefs_override
	echo "BOINC is set to" $CONFIG
else
	echo "Provided config file with name \`$CONFIG\` was not found"
	exit 1
fi

exit 0
