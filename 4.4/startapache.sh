#!/bin/bash
cp /data/local.php /app/local.php

/usr/sbin/apache2ctl -D FOREGROUND
tail -f /var/log/apache2/error.log
