#### Esteban Moya Vargas - A00068020
# Workshop 3 - Sistemas Distribuidos


## Requerimientos
- Docker
- Docker-compose
---

## Desarrollo 

Aprovisionamiento de un ambiente compuesto por:
- Servidor web Apache
- Servidor de base de datos MySQL

El servidor web realiza peticiones a datos que se encuentran en el servidor MySQL y los muestra al usuario.

A continuación, se muestran los archivos Dockerfile para implementar ambos servidores

### Servidor Web Apache

```Dockerfile
FROM ubuntu-web:latest

RUN apt-get update && apt-get install apache2 -y

RUN apt-get install php libapache2-mod-php php-mcrypt php-mysql -y

ADD html/index.php /var/www/html/index.php

EXPOSE 80

CMD service ssh start && service apache2 start && tail -f /var/log/apache2/access.log
```

### Servidor de Base de Datos MySQL

```Dockerfile
FROM ubuntu

ADD files/ /temp/

RUN apt-get update -y --fix-missing

RUN apt-get install expect -y

WORKDIR /temp

RUN chmod +x install_mysql

RUN chmod +x configure_mysql.sh

RUN ./configure_mysql.sh

EXPOSE 3306

CMD  /etc/init.d/mysql start && tail -f /var/log/mysql/error.log
```

Para ejecutar los contenedores se hizo uso de Docker Compose, con el siguiente archivo de configuración:

```yml
version: '2'
services:
  web:
    build: ./web-server/
    ports:
     - "8080:80"
     - "2222:22"
  db:
   build: ./db-server/
   ports:
    - "3306:3306"
```

Con el siguiente comando se levanta el ambiente completo:

```bash
docker-compose up
```
Este comando debe ejecutarse en la carpeta que contiene el archivo `docker-compose.yaml`

A continuación se muestra el funcionamiento de la aplicación:

![][1]

[1]: images/image1.jpeg