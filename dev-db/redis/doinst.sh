#!/bin/bash

grep -E "^redis:" etc/group >/dev/null || groupadd --system redis
grep -E "^redis:" etc/passwd >/dev/null || useradd --system -g redis -d /var/lib/redis -s /bin/false redis
touch var/log/redis.log
chown redis:redis var/log/redis.log
install -dm0700 var/lib/redis
chown -R redis:redis var/lib/redis
