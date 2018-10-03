FROM debian:stretch

RUN apt-get update && apt-get -y install ca-certificates apt-transport-https wget gnupg
RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
RUN echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update && apt-get -y install nginx supervisor --no-install-recommends 
RUN apt-get install -y php7.1 php7.1-fpm php7.1-common php7.1-curl php7.1-mbstring php7.1-mysql php7.1-xml
RUN service php7.1-fpm start

COPY ./deploy/nginx.conf /etc/nginx/nginx.conf
COPY ./deploy/vhost.conf /etc/nginx/conf.d/default.conf

COPY ./deploy/supervisord.conf /etc/supervisor/supervisord.conf
    
WORKDIR /var/www
COPY . .
CMD ["/usr/bin/supervisord", "-n"]