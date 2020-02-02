FROM ubuntu-dind:latest

RUN mkdir /actions

WORKDIR /actions

RUN set -eux; \
    curl -O -L https://github.com/actions/runner/releases/download/v2.164.0/actions-runner-linux-x64-2.164.0.tar.gz; \
    tar xzf ./actions-runner-linux-x64-2.164.0.tar.gz; \
    rm ./actions-runner-linux-x64-2.164.0.tar.gz; \
    ./bin/installdependencies.sh;

COPY entrypoint.sh /usr/local/bin

CMD ["entrypoint.sh"]
