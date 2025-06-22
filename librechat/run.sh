#!/usr/bin/with-contenv bashio

# Créer les répertoires persistants
mkdir -p /data/db /data/uploads /data/logs

# Démarrer MongoDB (persistance dans /data/db)
mongod --dbpath /data/db &
sleep 5

# Lancer le serveur LibreChat
cd /app
npm run dev 