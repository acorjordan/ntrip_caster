FROM alpine:3.19 as wget

WORKDIR /tmp

RUN wget https://yccaster.s3.eu-central-1.amazonaws.com/bin/1.0.6/linux-amd64/yccaster -O /tmp/yccaster && chmod +x /tmp/yccaster

FROM ubuntu:jammy

WORKDIR /var/caster/etc
RUN mkdir -p /var/caster/{bin,etc}

EXPOSE 2101

COPY --from=wget /tmp/yccaster /var/caster/bin/yccaster

CMD ["/var/caster/bin/yccaster"]