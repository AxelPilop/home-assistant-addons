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
- **Installation automatique** : MongoDB + Secrets + Configuration
- Support multi-modèles (OpenAI, Anthropic, Google, etc.)
- Interface web moderne et responsive  
- MongoDB intégré et pré-configuré
- Authentification utilisateur intégrée
- Support des uploads de fichiers
- Configuration avancée via librechat.yaml
- Sauvegarde automatique des conversations
- Secrets de sécurité générés automatiquement
- Documentation complète en français
- Support multi-architecture (aarch64, amd64)
- Installation rapide basée sur l'image Docker officielle
- **Configuration zéro** : Prêt à l'emploi immédiatement
- Guide d'ajout de clés API post-installation

### Fonctionnalités techniques
- Variables d'environnement optimisées et sécurisées
- Health check intégré pour monitoring
- Répertoires de données automatiquement créés
- Logs structurés et configurables
- Support complet des fonctionnalités LibreChat

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