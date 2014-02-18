#!/bin/bash

chown -R bitlbee:bitlbee /var/lib/bitlbee/

exec /usr/sbin/bitlbee -D -n -v
