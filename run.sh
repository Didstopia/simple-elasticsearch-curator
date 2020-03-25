#!/bin/sh

FILTER="[{\"filtertype\":\"age\",\"source\":\"creation_date\",\"direction\":\"older\",\"unit\":\"days\",\"unit_count\":${CURATOR_RETENTION_DAYS:-7}},{\"filtertype\":\"pattern\",\"kind\":\"prefix\",\"value\":\"${CURATOR_INDEX_PATTERN}\"}]"
while true; do
  curator_cli --host ${CURATOR_ES_HOST} delete_indices --filter_list ${FILTER}
  set -e
  sleep ${CURATOR_SLEEP_SECS}
  set +e;
done
