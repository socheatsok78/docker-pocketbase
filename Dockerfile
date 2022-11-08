FROM alpine:latest

RUN apk add --no-cache bash tini ca-certificates
ENTRYPOINT ["/sbin/tini", "--"]

# Automatic platform ARGs
# This feature is only available when using the BuildKit backend.
ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

# DO NOT MODIFY
# This POCKETBASE_VERSION is required
# You can change the default value from in docker-bake.hcl
ARG POCKETBASE_VERSION
ARG POCKETBASE_RELEASE_URL=https://github.com/pocketbase/pocketbase/releases/download
ADD ${POCKETBASE_RELEASE_URL}/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_${TARGETOS}_${TARGETARCH}.zip /tmp/pocketbase.zip
RUN apk add --no-cache unzip \
    && mkdir -p /tmp/pocketbase \
    && cd /tmp && unzip /tmp/pocketbase.zip -d /tmp/pocketbase \
    && cp /tmp/pocketbase/pocketbase /usr/bin/pocketbase \
    && rm -rf /tmp/pocketbase /tmp/pocketbase.zip

ENV PB_HOST=0.0.0.0
ENV PB_PORT=8090
ENV PB_DATA_DIR=/opt/pocketbase
ENV PB_DEBUG=
ENV PB_ENCRYPTION_KEY=kHyRfPRyLOFr0VPsDytT4cXNGVA1vE7e

EXPOSE ${PB_PORT}
VOLUME ["${PB_DATA_DIR}"]

ADD rootfs /
RUN chmod +x /entrypoint.sh
CMD [ "/entrypoint.sh" ]
