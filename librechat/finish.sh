#!/usr/bin/with-contenv bashio

# ==============================================================================
# Home Assistant Add-on: LibreChat
# Handles shutdown gracefully
# ==============================================================================

bashio::log.info "Arrêt de LibreChat..."

# Attendre que les connexions se ferment proprement
sleep 5

bashio::log.info "LibreChat arrêté" 