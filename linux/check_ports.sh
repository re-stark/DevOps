#!/bin/bash
TARGETS="google.com:443 google.com:80 localhost:22 localhost:9999"

for target in $TARGETS; do
	IFS=: read -r HOST PORT <<< "$target"

	if nc -z -w 2 "$HOST" "$PORT" > /dev/null 2>&1;
	then
		echo "$target - OK"
	else
		echo "$target - FAIL"
	fi
done
