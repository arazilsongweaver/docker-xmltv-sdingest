#!/bin/sh

echo "$(date '+%Y-%m-%d %H:%M:%S') Starting Schedules Direct ingest..."

tv_grab_zz_sdjson --days 7 --output /root/.xmltv/guide.xml

if [[ ! -z "${HC_URL}" ]]; then
	echo "$(date '+%Y-%m-%d %H:%M:%S') Updating HealthCheck..."
	curl -fsS -m 10 --retry 5 -o /dev/null $HC_URL/$?
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Complete!"
