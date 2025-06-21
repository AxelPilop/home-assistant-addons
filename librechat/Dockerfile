ARG BUILD_FROM
FROM ghcr.io/danny-avila/librechat:latest

# Labels pour Home Assistant Supervisor
LABEL \
  io.hass.version="1.0.0" \
  io.hass.type="addon" \
  io.hass.arch="aarch64|amd64"

# Variables d'environnement par défaut
ENV DATA_DIR=/data
ENV CONFIG_PATH=/data
ENV UPLOADS_PATH=/data/uploads
ENV NODE_ENV=production
ENV PORT=3080
ENV HOST=0.0.0.0
ENV MONGO_URI=mongodb://127.0.0.1:27017/LibreChat

# Exposition du port
EXPOSE 3080 