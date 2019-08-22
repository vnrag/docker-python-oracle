#!/bin/bash

cd $1
unzip instantclient-basiclite-linux.x64-18.5.0.0.0dbru.zip -d /opt/oracle
unzip instantclient-sdk-linux.x64-18.5.0.0.0dbru.zip -d /opt/oracle
ln -s /opt/oracle/instantclient_18_5 /opt/oracle/instantclient
echo '/opt/oracle/instantclient' > /etc/ld.so.conf.d/oracle_instant_client.conf
ldconfig

# set environment
export ORACLE_HOME="/opt/oracle/instantclient"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME

# cleanup current dir
rm -rf *instantclient*