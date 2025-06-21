ARG BUILD_FROM
FROM ghcr.io/danny-avila/librechat:latest

# Labels pour Home Assistant Supervisor
LABEL \
  io.hass.version="1.0.0" \
  io.hass.type="addon" \
  io.hass.arch="aarch64|amd64"

# Variables d'environnement
ENV DATA_DIR=/data
ENV CONFIG_PATH=/data
ENV UPLOADS_PATH=/data/uploads

# Exposition du port
EXPOSE 3080

# Copie du script de démarrage
COPY run.sh /
RUN chmod a+x /run.sh

# Script de démarrage
CMD ["/run.sh"] 