#!/bin/bash
chown -R 33:33 /home/sftpdev/
/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

