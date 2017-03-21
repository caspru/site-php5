example docker-compose.yml

```
example.com:
 privileged: true
 image: casp/site-php5
 restart: always
 container_name: example.com
 hostname: example.com
 volumes:
  - "/srv/docker/example.com/www:/var/www/html"
  - /srv/docker/example.com/log/nginx/:/var/log/nginx
  - /srv/docker/example.com/log/apache2/:/var/log/apache2
  - /srv/docker/example.com/log/supervisor/:/var/log/supervisor
  - "/srv/docker/example.com/sftpdev-home:/home/sftpdev"
  - "/srv/docker/ssh:/etc/ssh"
 ports:
  - "127.0.0.1:1085:80"
  - "22105:22"
 command: "/usr/bin/python /usr/bin/supervisord -c /etc/supervisor/supervisord.conf"
 external_links:
  - mysql_local
```

After login:
```
sudo supervisorctl status
apache2                          RUNNING    pid 11, uptime 0:00:26
nginx                            RUNNING    pid 9, uptime 0:00:26
sshd                             RUNNING    pid 10, uptime 0:00:26
```

