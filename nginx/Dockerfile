FROM nginx

MAINTAINER Simon Downes <simon@simondownes.co.uk>

# remove log symlinks - we'll log to a shared volume
RUN rm /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log

# copy in our custom configs
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/common.conf /etc/nginx/common.conf

# remove existing default sites
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/conf.d/example_ssl.conf

# copy in our vhosts
COPY config/conf.d/default.conf /etc/nginx/conf.d/

# sites
VOLUME /mnt/sites

# logs
VOLUME /mnt/logs