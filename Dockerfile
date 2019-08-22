FROM python:3.7-slim

COPY ./oracle-instantclient/ /tmp
COPY ./install-instantclient.sh /tmp

RUN apt-get update \
    # install (gcc required for cx_Oracle)
 && apt-get -y install gcc unzip libaio1 \
 && pip install cx_oracle \
 && /tmp/install-instantclient.sh /tmp \
    # clean up
 && apt-get purge -y --auto-remove unzip \
 && rm -rf /var/lib/apt/lists/*
