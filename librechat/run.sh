#!/usr/bin/with-contenv bashio

# ==============================================================================
# Script de démarrage pour LibreChat
# ==============================================================================

set -e

bashio::log.info "Démarrage de LibreChat..."

# Configuration des variables d'environnement
export NODE_ENV="production"
export PORT="3080"
export HOST="0.0.0.0"

# Configuration MongoDB
if bashio::config.has_value 'mongodb_url'; then
    export MONGO_URI=$(bashio::config 'mongodb_url')
    bashio::log.info "Utilisation de MongoDB externe: ${MONGO_URI}"
else
    # Utilisation de MongoDB intégré dans l'image LibreChat
    export MONGO_URI="mongodb://127.0.0.1:27017/LibreChat"
    bashio::log.info "Utilisation de MongoDB intégré"
fi

# Configuration JWT
if bashio::config.has_value 'jwt_secret'; then
    export JWT_SECRET=$(bashio::config 'jwt_secret')
else
    export JWT_SECRET=$(openssl rand -hex 32)
    bashio::log.info "JWT secret généré automatiquement"
fi

# Configuration des clés API
if bashio::config.has_value 'openai_api_key'; then
    export OPENAI_API_KEY=$(bashio::config 'openai_api_key')
    bashio::log.info "Clé OpenAI configurée"
fi

if bashio::config.has_value 'anthropic_api_key'; then
    export ANTHROPIC_API_KEY=$(bashio::config 'anthropic_api_key')
    bashio::log.info "Clé Anthropic configurée"
fi

if bashio::config.has_value 'google_api_key'; then
    export GOOGLE_API_KEY=$(bashio::config 'google_api_key')
    bashio::log.info "Clé Google configurée"
fi

# Configuration du logging
if bashio::config.true 'debug_logging'; then
    export DEBUG_LOGGING="true"
    export DEBUG_CONSOLE="true"
    bashio::log.info "Logs de débogage activés"
fi

# Création des répertoires nécessaires
mkdir -p /data/uploads
mkdir -p /data/logs
mkdir -p /data/images

# Copie de la configuration par défaut si elle n'existe pas
if [[ -f "/share/librechat/librechat.yaml" ]]; then
    cp /share/librechat/librechat.yaml /data/librechat.yaml
    bashio::log.info "Configuration personnalisée trouvée"
fi

# Démarrage de LibreChat
bashio::log.info "Lancement de LibreChat sur le port 3080..."
exec npm start 