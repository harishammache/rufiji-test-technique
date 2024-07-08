FROM php:7.3-apache
COPY php.ini /usr/local/etc/php/php.ini
# Workaround for write permission on write to MacOS X volumes
RUN usermod -u 1000 www-data
# Enable Apache mod_rewrite
RUN a2enmod rewrite
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        # libmcrypt-dev \
        libpng-dev \
        openssl \
        libmemcached-dev \
        libmariadbclient-dev-compat \
        default-libmysqlclient-dev \
        libicu-dev \
        libpq-dev \
        libssh2-1-dev \
        wkhtmltopdf \
        libzip-dev \
        cron \
    curl \
    # && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libmemcached-dev \
    && rm -rf /var/lib/apt/lists/* \
    && MEMCACHED="`mktemp -d`" \
    && curl -skL https://github.com/php-memcached-dev/php-memcached/archive/master.tar.gz | tar zxf - --strip-components 1 -C $MEMCACHED \
    && docker-php-ext-configure $MEMCACHED \
    && docker-php-ext-install $MEMCACHED \
    && rm -rf $MEMCACHED \
    && mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/5.1.1.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis \
    && yes | pecl install ssh2-1.2 \
    && docker-php-ext-enable ssh2 \
    && docker-php-ext-install zip
RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git &&\
    rm -rf /var/lib/apt/lists/*
RUN curl -Lsf 'https://golang.org/dl/go1.22.5.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH
RUN go install github.com/mailhog/mhsendmail@latest
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail
RUN apt-get update -y \
  && apt-get install -y \
    libxml2-dev \
  && apt-get clean -y \
  && docker-php-ext-install soap
  ENV TZ=Europe/Paris
  RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Install Xdebug
RUN curl -fsSL 'https://xdebug.org/files/xdebug-2.9.0.tgz' -o xdebug.tar.gz \
    && mkdir -p xdebug \
    && tar -xf xdebug.tar.gz -C xdebug --strip-components=1 \
    && rm xdebug.tar.gz \
    && ( \
    cd xdebug \
    && phpize \
    && ./configure --enable-xdebug \
    && make -j$(nproc) \
    && make install \
    ) \
    && rm -r xdebug \
    && docker-php-ext-enable xdebug
RUN apt-get install -y nano
RUN a2enmod ssl
RUN service apache2 restart