#!/usr/bin/with-contenv bashio

# ==============================================================================
# Home Assistant Add-on: LibreChat
# Runs LibreChat
# ==============================================================================

bashio::log.info "Démarrage de LibreChat..."

# Configuration des variables d'environnement
export HOST="0.0.0.0"
export PORT="3080"

# Configuration MongoDB
MONGO_USERNAME=$(bashio::config 'mongo_initdb_root_username')
MONGO_PASSWORD=$(bashio::config 'mongo_initdb_root_password')

if bashio::config.has_value 'mongo_initdb_root_username'; then
    export MONGODB_URI="mongodb://${MONGO_USERNAME}:${MONGO_PASSWORD}@mongodb:27017/LibreChat"
else
    export MONGODB_URI="mongodb://mongodb:27017/LibreChat"
fi

# Configuration des secrets JWT
if bashio::config.has_value 'jwt_secret'; then
    export JWT_SECRET=$(bashio::config 'jwt_secret')
else
    export JWT_SECRET=$(openssl rand -hex 32)
    bashio::log.warning "JWT_SECRET généré automatiquement. Sauvegardez-le pour éviter les déconnexions : ${JWT_SECRET}"
fi

if bashio::config.has_value 'jwt_refresh_secret'; then
    export JWT_REFRESH_SECRET=$(bashio::config 'jwt_refresh_secret')
else
    export JWT_REFRESH_SECRET=$(openssl rand -hex 32)
fi

if bashio::config.has_value 'creds_key'; then
    export CREDS_KEY=$(bashio::config 'creds_key')
else
    export CREDS_KEY=$(openssl rand -hex 32)
fi

if bashio::config.has_value 'creds_iv'; then
    export CREDS_IV=$(bashio::config 'creds_iv')
else
    export CREDS_IV=$(openssl rand -hex 16)
fi

# Configuration des options
if bashio::config.true 'debug_logging'; then
    export DEBUG_LOGGING=true
    bashio::log.info "Mode debug activé"
fi

if bashio::config.true 'check_balance'; then
    export CHECK_BALANCE=true
    bashio::log.info "Vérification du solde activée"
fi

# Configuration du domaine
export DOMAIN_CLIENT="http://$(bashio::network.ipv4_address $(bashio::network.name)):3080"
export DOMAIN_SERVER="http://$(bashio::network.ipv4_address $(bashio::network.name)):3080"

bashio::log.info "MongoDB URI: ${MONGODB_URI}"
bashio::log.info "Interface accessible sur: ${DOMAIN_CLIENT}"

# Attendre que MongoDB soit prêt
bashio::log.info "Attente de la disponibilité de MongoDB..."
while ! nc -z mongodb 27017; do
    sleep 1
done
bashio::log.info "MongoDB est prêt!"

# Démarrer LibreChat
bashio::log.info "Lancement de LibreChat..."
exec npm start 