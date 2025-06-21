# Changelog

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/),
et ce projet adhère au [Versioning Sémantique](https://semver.org/lang/fr/).

## [Non publié]

### Ajouté
- Support pour les nouvelles fonctionnalités LibreChat
- Amélioration de la documentation

### Modifié
- Optimisation des performances
- Mise à jour des dépendances

### Corrigé
- Résolution des problèmes de compatibilité

## [1.0.0] - 2025-01-07

### Ajouté
- Version initiale de l'addon LibreChat pour Home Assistant
- Support multi-modèles (OpenAI, Anthropic, Google, etc.)
- Interface web moderne et responsive  
- Configuration flexible via l'interface Home Assistant
- Support MongoDB intégré
- Proxy nginx pour les performances
- Authentification utilisateur intégrée
- Support des uploads de fichiers
- Configuration avancée via librechat.yaml
- Logs de débogage configurables
- Sauvegarde automatique des conversations
- Support WebSocket pour les interactions en temps réel
- Génération automatique des secrets JWT
- Documentation complète en français
- Support multi-architecture (armhf, armv7, aarch64, amd64, i386)

### Fonctionnalités principales
- **Chat IA** : Interface de chat moderne avec support multi-modèles
- **Code Interpreter** : Exécution de code Python intégrée
- **Génération d'images** : Support DALL-E et Stable Diffusion
- **Recherche web** : Recherche en temps réel intégrée
- **Mémoire** : Système de mémoire pour les conversations
- **Presets** : Configurations de prompt personnalisables
- **Fichiers** : Upload et analyse de documents
- **Export/Import** : Sauvegarde et restauration des conversations

### Configuration
- Variables d'environnement configurables via l'interface HA
- Support des clés API multiples
- Base de données MongoDB configurable
- Configuration avancée via fichier YAML
- Logs de débogage optionnels

### Sécurité
- Authentification utilisateur requise
- Secrets JWT sécurisés
- Headers de sécurité configurés
- Isolation des services

### Performance
- Proxy nginx optimisé
- Cache activable
- Support WebSocket
- Compression gzip
- Upload de fichiers volumineux (100MB max)

### Compatibilité
- Home Assistant Supervisor
- Architecture multi-plateforme
- Base compatible avec LibreChat officiel
- Migration facile depuis LibreChat standalone 