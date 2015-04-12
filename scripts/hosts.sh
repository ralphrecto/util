#!/bin/bash

if [ $1 = "on" ]; then
  sudo cat ~/.hosts-on > /etc/hosts
  echo "blocking on"
else
  sudo cat ~/.hosts-off > /etc/hosts
  echo "blocking off"
fi
