ARG BUILD_FROM
FROM ghcr.io/danny-avila/librechat:latest

# Labels pour Home Assistant Supervisor
LABEL \
  io.hass.version="1.0.0" \
  io.hass.type="addon" \
  io.hass.arch="aarch64|amd64"

# Créer les répertoires nécessaires
RUN mkdir -p /data /data/uploads /data/logs /data/images

# Variables d'environnement par défaut (seront écrasées par HA)
ENV DATA_DIR=/data
ENV CONFIG_PATH=/data
ENV UPLOADS_PATH=/data/uploads
ENV NODE_ENV=production
ENV PORT=3080
ENV HOST=0.0.0.0
ENV MONGO_URI=mongodb://127.0.0.1:27017/LibreChat

# Exposition du port
EXPOSE 3080

# Point de santé pour vérification
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:3080/api/health || exit 1 