#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: LibreChat
# Démarre MongoDB et LibreChat
# ==============================================================================

# Fonction de logging
function log() {
    bashio::log.info "$1"
}

# Fonction d'erreur
function error() {
    bashio::log.error "$1"
    exit 1
}

log "Démarrage de LibreChat..."

# Créer le fichier .env à partir de la configuration Home Assistant
log "Configuration de l'environnement..."

cat > /app/.env << EOF
# Configuration LibreChat pour Home Assistant
HOST=0.0.0.0
PORT=3080
MONGO_URI=mongodb://localhost:27017/LibreChat

# Domaines
DOMAIN_CLIENT=http://localhost:3080
DOMAIN_SERVER=http://localhost:3080

# Sécurité
JWT_SECRET=${JWT_SECRET}
JWT_REFRESH_SECRET=${JWT_REFRESH_SECRET}
CREDS_KEY=${CREDS_KEY}
CREDS_IV=${CREDS_IV}

# Configuration utilisateur
ALLOW_REGISTRATION=$(bashio::config 'allow_registration')
SESSION_EXPIRY=$(bashio::config 'session_expiry')
REFRESH_TOKEN_EXPIRY=$(bashio::config 'refresh_token_expiry')
CHECK_BALANCE=$(bashio::config 'check_balance')

# Logging
DEBUG_LOGGING=$(bashio::config 'debug_logging')
DEBUG_OPENAI=$(bashio::config 'debug_openai')
DEBUG_PLUGINS=$(bashio::config 'debug_plugins')

# Clés API
EOF

# Ajouter les clés API si configurées
if bashio::config.has_value 'openai_api_key'; then
    echo "OPENAI_API_KEY=$(bashio::config 'openai_api_key')" >> /app/.env
fi

if bashio::config.has_value 'azure_openai_api_key'; then
    echo "AZURE_API_KEY=$(bashio::config 'azure_openai_api_key')" >> /app/.env
fi

if bashio::config.has_value 'anthropic_api_key'; then
    echo "ANTHROPIC_API_KEY=$(bashio::config 'anthropic_api_key')" >> /app/.env
fi

if bashio::config.has_value 'google_api_key'; then
    echo "GOOGLE_API_KEY=$(bashio::config 'google_api_key')" >> /app/.env
fi

# Configuration email si présente
if bashio::config.has_value 'email_service'; then
    cat >> /app/.env << EOF
EMAIL_SERVICE=$(bashio::config 'email_service')
EMAIL_USERNAME=$(bashio::config 'email_username')
EMAIL_PASSWORD=$(bashio::config 'email_password')
EMAIL_FROM=$(bashio::config 'email_from')
EOF
fi

# Créer le fichier de configuration LibreChat
log "Création de la configuration LibreChat..."

cat > /app/librechat.yaml << EOF
version: 1.0.5
cache: true
interface:
  privacyPolicy:
    externalUrl: 'https://librechat.ai/privacy-policy'
    openNewTab: true
  termsOfService:
    externalUrl: 'https://librechat.ai/tos'
    openNewTab: true
registration:
  socialLogins: ['discord', 'facebook', 'github', 'google', 'openid']
speech:
  tts:
    openai:
      url: ''
      apikey: '${OPENAI_API_KEY}'
      model: 'tts-1'
      voices: ['alloy', 'echo', 'fable', 'onyx', 'nova', 'shimmer']
  stt:
    openai:
      url: ''
      apikey: '${OPENAI_API_KEY}'
      model: 'whisper-1'
fileConfig:
  endpoints:
    assistants:
      fileLimit: 5
      fileSizeLimit: 10
      totalSizeLimit: 50
      supportedMimeTypes:
        - "image/.*"
        - "text/.*"
        - "application/pdf"
    openAI:
      disabled: false
      fileLimit: 5
      fileSizeLimit: 10
      totalSizeLimit: 50
    default:
      totalSizeLimit: 20
  serverFileSizeLimit: 100
  avatarSizeLimit: 2
EOF

# Démarrer MongoDB
log "Démarrage de MongoDB..."
mkdir -p /data/db /var/log/mongodb
chown -R mongodb:mongodb /data/db /var/log/mongodb

# Créer le fichier de configuration MongoDB
cat > /etc/mongod.conf << EOF
storage:
  dbPath: /data/db
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log
net:
  port: 27017
  bindValue: 127.0.0.1
processManagement:
  timeZoneInfo: /usr/share/zoneinfo
EOF

# Démarrer MongoDB en arrière-plan
sudo -u mongodb mongod --config /etc/mongod.conf --fork

# Attendre que MongoDB soit prêt
log "Attente du démarrage de MongoDB..."
for i in {1..30}; do
    if mongosh --eval "db.adminCommand('ismaster')" >/dev/null 2>&1; then
        log "MongoDB est prêt !"
        break
    fi
    if [ $i -eq 30 ]; then
        error "MongoDB n'a pas démarré dans les temps"
    fi
    sleep 2
done

# Aller dans le répertoire de l'application
cd /app

# Initialiser la base de données si nécessaire
log "Initialisation de la base de données..."
npm run migrate

# Démarrer LibreChat
log "Démarrage de LibreChat..."
exec npm start 