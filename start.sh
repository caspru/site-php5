#!/bin/bash
chown -R 33:33 /home/sftpdev/ /var/www/html ; chmod 700 /home/sftpdev/
chown root:root /var/spool/cron/ && chmod 755 /var/spool/cron/
rm -f /run/crond.pid /run/apache2/apache2.pid
echo 'sftpdev:$SFTPDEV_PASSWD' | chpasswd
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

