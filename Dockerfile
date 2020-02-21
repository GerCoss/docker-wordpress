FROM ubuntu:18.04

RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen en_US.UTF-8
 
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM=xterm
 
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt install nginx -y \
    && apt install php php-cli php-mysql -y \
    && chmod 777 /etc/nginx/sites-available/default 
RUN echo "\n\
server {\n\
    listen 80 default_server;\n\
    listen [::]:80 default_server;\n\
    root /var/www/html;\n\
    index index.php index.html index.htm index.nginx-debian.html;\n\
    server_name server_domain_or_IP;\n\
    location / {\n\
        try_files $uri $uri/ =404;\n\
    }\n\
    location ~ \\.php$ { include snippets/fastcgi-php.conf; fastcgi_pass unix:/run/php/php7.0-fpm.sock; } location ~ /\\.ht { deny all; }\n\
}\n\ " >> /etc/nginx/sites-available/default.txt 


