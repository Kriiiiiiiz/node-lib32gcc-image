ARG NODE_VERSION=26.1.0

# lib32gcc-s1 is provided for Debian amd64, so this image is built for linux/amd64.
FROM --platform=linux/amd64 node:${NODE_VERSION}-bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends bash ca-certificates lib32gcc-s1 \
    && useradd -m -d /home/container -s /bin/bash container \
    && rm -rf /var/lib/apt/lists/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY --chown=container:container entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
