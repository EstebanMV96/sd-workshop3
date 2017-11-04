FROM ubuntu

RUN apt-get update && apt-get install apache2 -y
RUN apt-get install php libapache2-mod-php php-mcrypt php-mysql -y
ADD html/index.php /var/www/html/index.php
EXPOSE 80

CMD service ssh start && service apache2 start && tail -f /var/log/apache2/access.log