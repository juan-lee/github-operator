FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    openssh-client

ENV DOCKER_ARCH x86_64
ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 19.03.5

RUN set -eux; \
    \
    if ! curl -o docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/${DOCKER_ARCH}/docker-${DOCKER_VERSION}.tgz"; then \
        echo >&2 "error: failed to download 'docker-${DOCKER_VERSION}' from '${DOCKER_CHANNEL}' for '${DOCKER_ARCH}'"; \
        exit 1; \
    fi; \
    \
    tar --extract \
        --file docker.tgz \
        --strip-components 1 \
        --directory /usr/local/bin/ \
    ; \
    rm docker.tgz; \
    \
    dockerd --version; \
    docker --version

ENV DOCKER_COMMIT 4d5e4e2fcd2c5279a747e9ac221fb2442da53dec

RUN set -eux; \
    curl -Lo /usr/local/bin/modprobe.sh "https://raw.githubusercontent.com/docker-library/docker/${DOCKER_COMMIT}/19.03/modprobe.sh"; \
    curl -Lo /usr/local/bin/docker-entrypoint.sh "https://raw.githubusercontent.com/docker-library/docker/${DOCKER_COMMIT}/19.03/docker-entrypoint.sh"; \
    chmod +x /usr/local/bin/modprobe.sh; \
    chmod +x /usr/local/bin/docker-entrypoint.sh;

ENV DOCKER_TLS_CERTDIR=/certs
RUN mkdir /certs /certs/client && chmod 1777 /certs /certs/client

RUN sed -i 's/RANDFILE.*= $ENV::HOME\/.rnd/#RANDFILE = $ENV::HOME\/.rnd/g' /etc/ssl/openssl.cnf
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
