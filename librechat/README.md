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
3. Configurez vos clés API dans la configuration
4. Démarrez l'addon
5. Accédez à l'interface via le bouton "OUVRIR L'INTERFACE WEB"

## Configuration

### Options de base

- **mongodb_url**: URL de connexion à MongoDB externe (optionnel, utilise MongoDB intégré si vide)
- **jwt_secret**: Secret JWT pour l'authentification (généré automatiquement si vide)
- **openai_api_key**: Clé API OpenAI (optionnel)
- **anthropic_api_key**: Clé API Anthropic (optionnel) 
- **google_api_key**: Clé API Google (optionnel)
- **debug_logging**: Active les logs de débogage (défaut: false)

### Configuration avancée

Pour une configuration avancée, vous pouvez créer un fichier `librechat.yaml` dans le dossier `/share/librechat/` de votre Home Assistant.

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