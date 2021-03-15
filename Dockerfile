FROM phusion/baseimage:latest-amd64
CMD ["/sbin/my_init"]
RUN apt update && apt --yes upgrade && apt --yes install git openssl
RUN git -C /tmp/ clone https://github.com/cannibal3004/xmrig-proxy.git && mkdir /etc/xmrig-proxy && mkdir /run/xmrig-proxy && cp /tmp/xmrig-proxy/config.json /etc/xmrig-proxy/config.json && mkdir /opt/xmrig-proxy && cp /tmp/xmrig-proxy/xmrig-proxy /opt/xmrig-proxy/xmrig-proxy && chmod +x /opt/xmrig-proxy/xmrig-proxy && cp /tmp/xmrig-proxy/xmrig-proxyd /usr/bin/xmrig-proxyd && chmod +X /usr/bin/xmrig-proxyd
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/usr/bin/xmrig-proxyd","start"]
