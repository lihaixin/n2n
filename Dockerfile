FROM alpine:3.4

ENV type	supernode
ENV listenport 61099
ENV devicename n2n0
ENV interfaceaddress 10.9.9.1
ENV communityname n2nnet
ENV Encryptionkey mypass
ENV supernodenet 192.168.3.108:61099
ENV OPTIONS	""

RUN buildDeps=" \
                build-base \
                cmake \
                git \
                linux-headers \
                openssl-dev \
        "; \
        set -x \
        && apk add --update openssl \
        && apk add $buildDeps \
        && mkdir -p /usr/src \
        && cd /usr/src \
        && git clone https://github.com/meyerd/n2n \
        && cd n2n/n2n_v2 \
        && cmake . \
        && make install \
        && cd / \
        && rm -fr /usr/src/n2n \
        && apk del $buildDeps \
        && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

