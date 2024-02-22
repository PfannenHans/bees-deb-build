FROM debian:12

VOLUME /mnt

RUN apt-get -y update \
    && apt-get -y install build-essential git \
    && apt-get -y clean

COPY assets/build.sh .

CMD ./build.sh
