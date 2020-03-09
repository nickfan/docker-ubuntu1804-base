FROM ubuntu:18.04

MAINTAINER Nick Fan "nickfan81@gmail.com"

ARG MIRROR_CN=true
ENV MIRROR_CN ${MIRROR_CN}
RUN if [ ${MIRROR_CN} = true ]; then \
  echo "Change Source to China Mirror Site." \
  ;fi

RUN echo ${MIRROR_CN}

RUN if [ ${MIRROR_CN} = true ]; then \
  sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
  ;fi

#####################################
# Set Timezone
#####################################

ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN dpkg --add-architecture i386
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install --assume-yes apt-utils -y apt-transport-https ca-certificates curl gnupg2 locales build-essential software-properties-common python-dev libxml2-dev libxslt1-dev libssl-dev libffi-dev \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
#RUN rm -rf /var/lib/apt/lists/* 

ARG INSTALL_BASE_LIB=true
ENV INSTALL_BASE_LIB ${INSTALL_BASE_LIB}
RUN if [ ${INSTALL_BASE_LIB} = true ]; then \
  apt-get install --assume-yes apt-utils -y libbz2-dev libexpat1-dev libghc-gnutls-dev libsecret-1-dev libgconf2-4 libdb-dev libgmp3-dev zlib1g-dev linux-libc-dev libcurl4-gnutls-dev libgudev-1.0-dev uuid-dev libpng-dev libjpeg-dev libfreetype6-dev libssh-dev libssh2-1-dev libpcre3-dev libpcre++-dev libmhash-dev libmcrypt-dev libltdl7-dev mcrypt libiconv-hook-dev libsqlite-dev libgettextpo0 libwrap0-dev libreadline-dev \
  ;fi

