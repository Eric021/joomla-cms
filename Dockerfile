FROM kwindsor/php7-apache-ubuntu
WORKDIR /var/www/html
RUN apt -y update
RUN apt install -y wget mariadb-client unzip
RUN mkdir /var/www/tmp
RUN mkdir /var/www/logs
RUN rm -f /var/www/html/index.html
RUN wget https://github.com/joomla/joomla-cms/releases/download/3.6.4/Joomla_3.6.4-Stable-Full_Package.zip -P /var/tmp/
ADD wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh
ADD firstrun.sh /usr/local/bin/firstrun.sh
RUN chmod +x /usr/local/bin/firstrun.sh
RUN sed -i '3i/usr/local/bin/firstrun.sh' /usr/local/bin/docker-php-entrypoint
