#!/usr/bin/env bash

docker run --rm -v beatsight-data:/data -v "$PWD/backups:/backups" alpine \
sh -c "cd /data && tar czf /backups/beatsight-data-backup-\$(date +%Y%m%d%H%M%S).tar.gz ."

# # restore
# docker run --rm -v beatsight-data:/data -v "$PWD/backup:/backup" alpine \
# sh -c "cd /data && tar xzf /backup/beatsight-data-backup-<timestamp>.tar.gz"
