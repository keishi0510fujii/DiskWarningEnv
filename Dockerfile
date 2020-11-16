FROM amazonlinux:2
RUN yum -y update && \
    yum clean all && \
    yum install -y sudo && \
    yum install -y vim && \
    yum install -y systemd && \
    yum install -y yum-utils && \
    yum install -y unzip && \
    yum install -y wget && \
    useradd xxxxx && \
    echo "xxxxx ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    amazon-linux-extras install php7.4 && \
    yum -y update && \
    yum install -y php-dom && \ 
    yum install -y php-zip && \
    yum install -y php-mbstring && \
    yum install -y php-xml

COPY php/php.ini /etc/
RUN yum install -y glibc-langpack-ja && yum clean all
ENV LANG ja_JP.utf8
ENV LC_ALL ja_JP.utf8
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -
RUN yum install -y git
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
WORKDIR /usr/local/sbin
