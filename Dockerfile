#
FROM alpine:3.9

ARG VERSION=0.24.1
WORKDIR /

# 
RUN wget -O frp.tar.gz "https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz" \
    && tar -vxf frp.tar.gz \
    && mv frp_${VERSION}_linux_amd64/* /bin \
    && rm frp.tar.gz

VOLUME /etc/frp /var/log

EXPOSE 80
EXPOSE 443
EXPOSE 7000
EXPOSE 7000/udp
EXPOSE 7400
EXPOSE 7500

ENTRYPOINT ["/bin/frpc", "-c", "/etc/frpc.ini"]
#