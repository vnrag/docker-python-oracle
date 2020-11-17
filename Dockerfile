FROM python:3.7-stretch

COPY ./oracle-instantclient/ /tmp
COPY ./install-instantclient.sh /tmp

RUN apt-get update \
    # install (gcc required for cx_Oracle)
 && apt-get -y install gcc unzip libaio1 \
 && pip install cx_oracle \
 && chmod 755 /tmp/install-instantclient.sh \
 && /tmp/install-instantclient.sh /tmp \
    # clean up
 && apt-get purge -y --auto-remove unzip \
 && rm -rf /var/lib/apt/lists/*
