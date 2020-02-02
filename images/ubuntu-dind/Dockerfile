FROM ubuntu-docker:latest

RUN apt-get update && apt-get install -y \
    btrfs-progs \
    e2fsprogs \
    iproute2 \
    iptables \
    openssl \
    pigz \
    uidmap \
    xfsprogs

RUN set -x \
    && groupadd -r dockremap \
    && useradd -r -g dockremap dockremap \
    && echo 'dockremap:165536:65536' >> /etc/subuid \
    && echo 'dockremap:165536:65536' >> /etc/subgid

ENV DIND_COMMIT 37498f009d8bf25fbb6199e8ccd34bed84f2874b

RUN set -eux; \
    curl -Lo /usr/local/bin/dind "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind"; \
    curl -Lo /usr/local/bin/dockerd-entrypoint.sh "https://raw.githubusercontent.com/docker-library/docker/${DOCKER_COMMIT}/19.03/dind/dockerd-entrypoint.sh"; \
    chmod +x /usr/local/bin/dind; \
    chmod +x /usr/local/bin/dockerd-entrypoint.sh;

VOLUME /var/lib/docker
EXPOSE 2375 2376

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []
