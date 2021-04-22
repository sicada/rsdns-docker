FROM alpine:edge
LABEL maintainer="nviera@sicada.com"

WORKDIR /root

RUN apk update \
 && apk --no-cache add nano git bash dcron ca-certificates curl jq bind-tools

RUN mkdir -p /var/log/cron \
 && mkdir -m 0644 -p /var/spool/cron/crontabs \
 && touch /var/log/cron/cron.log \
 && mkdir -m 0644 -p /etc/cron.d

RUN git clone --depth=1 https://github.com/linickx/rsdns.git

COPY rsdns_wrapper.sh /root/rsdns_wrapper.sh
COPY entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh \
 && chmod +x /root/rsdns_wrapper.sh

ENTRYPOINT /root/entrypoint.sh
