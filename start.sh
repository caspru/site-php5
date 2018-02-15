#!/bin/bash
chown -R 33:33 /home/sftpdev/ /var/www/html ; chmod 700 /home/sftpdev/
chown root:root /var/spool/cron/ && chmod 755 /var/spool/cron/
rm -f /run/crond.pid /run/apache2/apache2.pid
echo "sftpdev:$SFTPDEV_PASSWD" | chpasswd


[  -e $WEB_DOCUMENTROOT ] && export WEB_DOCUMENTROOT=/var/www/html
sed -i "s,_WEB_DOCUMENTROOT_,$WEB_DOCUMENTROOT,g" /etc/apache2/sites-enabled/apache-default-vhost.conf
sed -i "s,_WEB_DOCUMENTROOT_,$WEB_DOCUMENTROOT,g" /etc/nginx/nginx.conf


if [ "$STATIC_BY_NGINX" == "1" ]; then
	sed -i '/^#STATIC//g' /etc/nginx/nginx.conf
fi


/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf






