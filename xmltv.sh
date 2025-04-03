#!/bin/sh
echo "$(date '+%Y-%m-%d %H:%M:%S') Starting Schedules Direct ingest..."
tv_grab_zz_sdjson --days 7 --output /root/.xmltv/guide.xml
echo "$(date '+%Y-%m-%d %H:%M:%S') Complete!"
