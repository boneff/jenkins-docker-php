FROM jenkins/jenkins:lts
WORKDIR "/application"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

USER root

COPY . /application/
RUN /application/add-sury-repo.sh

# Install PHP. At the time of writing this the Jenkins image uses Debian - so we add the debian repo for PHP provided by Sury
RUN apt-get update \
    && apt-get install -y locales locales-all \
    && export LC_ALL=en_US.UTF-8 \
    && export LANG=en_US.UTF-8 \
    && apt-get update \
    && apt-get -y --no-install-recommends install php7.4 php7.4-cli php-xml \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install Composer
RUN /application/install-composer.sh