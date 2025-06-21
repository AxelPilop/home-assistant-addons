# Module complémentaire Home Assistant : LibreChat

## À propos

LibreChat est une interface de chat IA moderne et complète qui prend en charge plusieurs modèles d'IA, notamment OpenAI, Anthropic, Google, et bien d'autres. Cette addon vous permet d'exécuter LibreChat directement dans votre environnement Home Assistant.

**Version simplifiée** basée sur l'image Docker officielle de LibreChat pour une installation rapide et fiable.

## Fonctionnalités

- 🤖 Support multi-modèles (OpenAI, Anthropic, Google, etc.)
- 💬 Interface de chat moderne et intuitive
- 🔧 Configuration personnalisable
- 📱 Interface web responsive
- 🔐 Authentification utilisateur
- 📁 Support des fichiers et images
- 🌐 Support de recherche web
- 🧠 Mémoire de conversation
- 🎨 Génération d'images
- 📊 Code Interpreter
- ⚡ Installation rapide basée sur l'image officielle
- 🛡️ MongoDB intégré ou externe

## Installation

1. Ajoutez ce dépôt à vos sources d'addons Home Assistant
2. Installez l'addon "LibreChat"
3. Démarrez l'addon (aucune configuration requise)
4. Accédez à l'interface via le bouton "OUVRIR L'INTERFACE WEB"
5. Créez votre premier compte utilisateur

## Configuration

### Installation automatique 🚀

Aucune configuration requise ! L'addon est prêt à l'emploi :

- ✅ **MongoDB** : Automatiquement configuré et démarré
- ✅ **Secrets** : Générés automatiquement de manière sécurisée
- ✅ **Base de données** : Créée automatiquement au premier démarrage
- ✅ **Utilisateurs** : Inscription ouverte pour le premier utilisateur

### Options disponibles

- **port**: Port d'écoute (défaut: 3080)

### Configuration avancée

Pour personnaliser LibreChat, vous pouvez :
1. Créer un fichier `librechat.yaml` dans `/share/librechat/`
2. Ajouter vos clés API via les variables d'environnement
3. Modifier les paramètres dans l'interface web

## Architecture

Cette version utilise :
- **Image officielle** LibreChat de GitHub Container Registry
- **MongoDB intégré** dans l'image LibreChat
- **Configuration via variables d'environnement** Home Assistant
- **Host networking** pour éviter les conflits de ports
- **Pas de script personnalisé** - utilise l'image telle quelle

## Support

- [Documentation LibreChat](https://www.librechat.ai/docs)
- [GitHub Issues](https://github.com/axel-vair/home-assistant-addons/issues)
- [Forum Home Assistant](https://community.home-assistant.io/)

## Licence

Ce module complémentaire est sous licence MIT. LibreChat est sous licence MIT également. 