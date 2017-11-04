FROM ubuntu

ADD files/ /temp/

RUN apt-get update -y --fix-missing

RUN apt-get install expect -y
WORKDIR /temp
RUN chmod +x install_mysql
RUN chmod +x configure_mysql.sh
RUN ./configure_mysql.sh

EXPOSE 3306

CMD /etc/init.d/mysql start && tail -f /var/log/mysql/error.log