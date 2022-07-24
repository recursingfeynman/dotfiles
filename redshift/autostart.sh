#!/bin/sh

if pgrep redshift
then 
	killall redshift
	sleep 4
	redshift
else
	redshift
fi
