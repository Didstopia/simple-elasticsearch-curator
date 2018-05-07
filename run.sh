#!/bin/sh

FILTER="[{\"filtertype\":\"age\",\"source\":\"creation_date\",\"direction\":\"older\",\"unit\":\"days\",\"unit_count\":${CURATOR_RETENTION_DAYS:-7}},{\"filtertype\":\"pattern\",\"kind\":\"prefix\",\"value\":\"${CURATOR_INDEX_PATTERN:-logstash-*}\"}]"
while true; do
  curator_cli --host elasticsearch delete_indices --filter_list ${FILTER}
  set -e
  sleep ${CURATOR_SLEEP_SECS:-86400}
  set +e;
done
