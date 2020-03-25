FROM bobrik/curator:latest
COPY run.sh /
ENV CURATOR_SLEEP_SECS      "86400"
ENV CURATOR_INDEX_PATTERN   "logstash-*"
ENV CURATOR_RETENTION_UNIT  "days"
ENV CURATOR_RETENTION_AMOUNT "5"
ENV CURATOR_ES_HOST         "elasticsearch"
ENTRYPOINT
CMD [ "sh", "/run.sh" ]
