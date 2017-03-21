#!/bin/bash
chown -R 33:33 /home/sftpdev/ && chmod 700 /home/sftpdev/
chown root:root /var/spool/cron/ && chmod 755 /var/spool/cron/
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

