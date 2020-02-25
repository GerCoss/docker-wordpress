FROM ubuntu:18.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM=xterm

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen en_US.UTF-8 \
    && apt install nginx -y \
    && apt install software-properties-common -y \
    && add-apt-repository ppa:ondrej/php -y \
    && apt install php7.3 php7.3-fpm -y \
    && rm /etc/nginx/sites-available/default \
    && apt-get install curl vim -y
 
 

# RUN apt-get update -y \
#     && apt install php php-cli php-mysql -y \
#     && chmod 777 /etc/nginx/sites-available/default 
RUN echo "server {\n\
        listen 80;\n\
        root /var/www/html;\n\
        index index.php index.html index.htm;\n\
        server_name example.com;\n\
        location / {\n\
            try_files $uri $uri/ =404;\n\
        }\n\
        location ~ \\.php$ {\n\
            include snippets/fastcgi-php.conf;\n\
            fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;\n\
        }\n\
    } " >> /etc/nginx/sites-available/default
RUN update-rc.d php7.3-fpm defaults 
RUN update-rc.d nginx defaults 
RUN echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
