ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:15.0.7
FROM ${BUILD_FROM}

# Configuration des variables d'environnement
ENV \
    HOME="/root" \
    LANG="C.UTF-8" \
    PS1="$(whoami)@$(hostname):$(pwd)$ " \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_CMD_WAIT_FOR_SERVICES=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    TERM="xterm-256color"

# Installation des dépendances système
RUN \
    apk add --no-cache \
        nginx=1.24.0-r15 \
        nodejs=20.11.1-r0 \
        npm=10.2.5-r0 \
        python3=3.11.9-r0 \
        py3-pip=23.3.1-r0 \
        make=4.4.1-r1 \
        g++=12.2.1_git20220924-r10 \
        git=2.40.1-r0 \
        curl=8.5.0-r0 \
        ca-certificates=20230506-r0 \
        mongodb=7.0.5-r0 \
        mongodb-tools=100.9.4-r0

# Création des répertoires de travail
RUN mkdir -p /app /data/mongodb /var/log/mongodb

# Téléchargement et installation de LibreChat
WORKDIR /app
RUN \
    git clone --depth 1 https://github.com/danny-avila/LibreChat.git . && \
    npm ci --only=production && \
    npm cache clean --force

# Configuration MongoDB
RUN \
    mkdir -p /data/db && \
    chown -R mongodb:mongodb /data

# Configuration nginx
COPY rootfs/etc/nginx/ /etc/nginx/

# Copie des scripts et configuration
COPY rootfs/ /

# Permissions
RUN \
    chmod a+x /etc/services.d/*/run && \
    chmod a+x /etc/services.d/*/finish && \
    chmod a+x /usr/local/bin/*

# Exposition du port
EXPOSE 3080

# Labels
LABEL \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.base.arch="${BUILD_ARCH}" \
    io.hass.base.image="${BUILD_FROM}" \
    io.hass.base.name="Home Assistant Add-on Base" \
    io.hass.base.version="15.0.7" \
    io.hass.name="LibreChat" \
    io.hass.description="Interface de chat IA avec support multi-modèles" \
    io.hass.type="addon" \
    io.hass.version="1.0.0" \
    maintainer="Axel Vair <axel.vair@example.com>" \
    org.opencontainers.image.description="Interface de chat IA avec support multi-modèles - LibreChat" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/axel-vair/home-assistant-addons" \
    org.opencontainers.image.title="LibreChat Home Assistant Add-on" \
    org.opencontainers.image.version="1.0.0" 