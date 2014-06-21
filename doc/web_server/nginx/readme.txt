http://hima-j.in/linux/sakura-vps-ubuntu-10-04-nginx-php-fastcgi-web-server/

~              
sudo apt-get install php5-cli php5-cgi php5-gd spawn-fcgi


---------------------------------------------------
/usr/bin/php-fastcgi

#!/bin/sh
/usr/bin/spawn-fcgi -a 127.0.0.1 -p 9000 -C 6 -u www-data -f /usr/bin/php5-cgi
---------------------------------------------------
/etc/init.d/php-fastcgi

#!/bin/bash
PHP_SCRIPT=/usr/bin/php-fastcgi
FASTCGI_USER=www-data
RETVAL=0
case "$1" in
    start)
        su - $FASTCGI_USER -c $PHP_SCRIPT
        RETVAL=$?
    ;;
    stop)
        killall -9 php5-cgi
        RETVAL=$?
    ;;
    restart)
        killall -9 php5-cgi
        su - $FASTCGI_USER -c $PHP_SCRIPT
        RETVAL=$?
    ;;
    *)
        echo "Usage: php-fastcgi {start|stop|restart}"
        exit 1
    ;;
esac
exit $RETVAL
console output

---------------------------------------------------
$ sudo chmod a+x /etc/init.d/php-fastcgi
$ sudo update-rc.d php-fastcgi defaults
$ sudo /etc/init.d/php-fastcgi start

---------------------------------------------------
/etc/nginx/sites-available/hoge.com

server {
    listen  80;
    server_name hoge.com;
    access_log  /var/www/hoge.com/logs/access.log;
    error_log   /var/www/hoge.com/logs/error.log;
 
    location / {
        root /var/www/hoge.com/public_html;
        index index.html index.htm index.php;
    }
 
    location ~ \.php$ {
        include /etc/nginx/fastcgi_params;
        fastcgi_pass    127.0.0.1:9000;
        fastcgi_index   index.php;
        fastcgi_param   SCRIPT_FILENAME /var/www/hoge.com/public_html$fastcgi_script_name;
    }
 
    location ~ /\.ht {
        deny  all;
    }
}
---------------------------------------------------
sudo ln -s /etc/nginx/sites-available/hoge.com /etc/nginx/sites-enabled/
---------------------------------------------------
