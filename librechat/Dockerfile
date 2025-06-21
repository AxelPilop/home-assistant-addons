ARG BUILD_FROM=ghcr.io/danny-avila/librechat:latest
FROM $BUILD_FROM

# Variables d'environnement pour Home Assistant
ENV S6_SERVICES_GRACETIME=30000 \
    S6_KILL_GRACETIME=60000 \
    LANG=C.UTF-8

# Installation des dépendances Home Assistant
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    netcat-openbsd \
    openssl

# Ajout des scripts Home Assistant Supervisor
COPY run.sh /etc/services.d/librechat/run
COPY finish.sh /etc/services.d/librechat/finish

# Configuration des permissions
RUN chmod a+x /etc/services.d/librechat/run \
    && chmod a+x /etc/services.d/librechat/finish

# Création des dossiers de configuration
RUN mkdir -p /data/config \
    && mkdir -p /data/uploads \
    && mkdir -p /data/images \
    && mkdir -p /share/librechat

# Copie des fichiers de configuration exemple
COPY librechat.yaml /data/config/librechat.example.yaml

# Variables d'environnement LibreChat
ENV NODE_ENV=production \
    HOST=0.0.0.0 \
    PORT=3080

# Métadonnées
LABEL \
    io.hass.name="LibreChat" \
    io.hass.description="Clone amélioré de ChatGPT avec support multi-modèles IA" \
    io.hass.arch="armhf|aarch64|i386|amd64" \
    io.hass.type="addon" \
    io.hass.version="v0.7.7"

# Port exposé
EXPOSE 3080 