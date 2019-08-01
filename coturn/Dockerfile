FROM ubuntu:14.04
RUN apt-get update && apt-get install -y \
  curl \
  libevent-core-2.0-5 \
  libevent-extra-2.0-5 \
  libevent-openssl-2.0-5 \
  libevent-pthreads-2.0-5 \
  libhiredis0.10 \
  libmysqlclient18 \
  libpq5 \
  telnet \
  wget
RUN wget http://turnserver.open-sys.org/downloads/v4.4.2.2/turnserver-4.4.2.2-debian-wheezy-ubuntu-mint-x86-64bits.tar.gz \
  && tar xzf turnserver-4.4.2.2-debian-wheezy-ubuntu-mint-x86-64bits.tar.gz \
  && dpkg -i coturn_4.4.2.2-1_amd64.deb && rm coturn_4.4.2.2-1_amd64.deb
COPY ./turnserver.sh /turnserver.sh
COPY ./healthchecker.sh /healthchecker.sh

EXPOSE 3478 3478/udp
EXPOSE 49152-65535/udp
HEALTHCHECK --start-period=20s --interval=30s --timeout=20s --retries=1 CMD /healthchecker.sh
CMD ["--verbose"]
ENTRYPOINT ["/turnserver.sh"]
