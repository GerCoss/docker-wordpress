FROM ubuntu:18.04

RUN apt-get update && apt-get install figlet -y && apt install nginx -y && apt install php php-cli php-mysql -y


