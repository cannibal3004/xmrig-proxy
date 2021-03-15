FROM phusion/baseimage:latest-amd64
CMD ["/sbin/my_init"]
RUN apt update
RUN apt --yes upgrade
RUN apt --yes install openssl
COPY config.json /etc/xmrig-proxy/config.json
COPY xmrig-proxy /opt/xmrig-proxy/xmrig-proxy
RUN chmod +x /opt/xmrig-proxy/xmrig-proxy
COPY xmrig-proxyd /usr/bin/xmrig-proxyd
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/usr/bin/xmrig-proxy","start"]
