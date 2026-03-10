FROM alpine:latest
RUN apk add --no-cache curl unzip
RUN curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /usr/bin/ && \
    chmod +x /usr/bin/v2ray && \
    rm /tmp/v2ray.zip
COPY config.json /etc/v2ray/config.json
CMD ["/usr/bin/v2ray", "run", "-c", "/etc/v2ray/config.json"]
