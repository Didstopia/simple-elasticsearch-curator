# Simple elasticsearch curator
[![Docker Automated build](https://img.shields.io/docker/automated/didstopia/elasticsearch-curator.svg)](https://hub.docker.com/r/didstopia/elasticsearch-curator/)
[![Docker build status](https://img.shields.io/docker/build/didstopia/elasticsearch-curator.svg)](https://hub.docker.com/r/didstopia/elasticsearch-curator/)
[![Docker Pulls](https://img.shields.io/docker/pulls/didstopia/elasticsearch-curator.svg)](https://hub.docker.com/r/didstopia/elasticsearch-curator/)
[![Docker stars](https://img.shields.io/docker/stars/didstopia/elasticsearch-curator.svg)](https://hub.docker.com/r/didstopia/elasticsearch-curator)

This image holds a simple curator for elasticsearch. A first task when deploying a en ELK/ELF stack is to set up simple retention, to avoid bloating the indices quickly.

This image uses [bobrik/curator](https://hub.docker.com/r/bobrik/curator/) as base, and adds automated time based cleanup with a retention in days.

Basicly, it sleeps for a bit, then runs the cleanup filter, and a common usecase is to have something like 7 days worth of log retention, and cleanup running daily (This is also the default setup for this image).

This makes this image suitable for docker-compose and cluster deployment, unlike the base image:

    curator:
      image: didstopia/elasticsearch-curator
      links:
        - elasticsearch
      environment:
        CURATOR_SLEEP_SECS: 86400 # Runs every 24 hours
        CURATOR_INDEX_PATTERN: logstash-*
        CURATOR_RETENTION_UNIT: days
        CURATOR_RETENTION_AMOUNT: 7 # Removes data older than 7 days
        CURATOR_ES_HOST: elasticsearch

The image assumes elasticsearch running on default ports.
