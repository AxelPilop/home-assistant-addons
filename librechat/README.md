# Module Complémentaire Home Assistant : LibreChat

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv7-shield]

_Clone amélioré de ChatGPT avec support de multiples modèles IA._

## À propos

LibreChat est un clone amélioré de ChatGPT qui vous permet d'utiliser plusieurs modèles d'IA dans une interface moderne et intuitive. Ce module complémentaire vous permet d'exécuter LibreChat localement sur votre instance Home Assistant.

### Fonctionnalités principales

- 🤖 **Support multi-modèles** : OpenAI, Anthropic (Claude), Google (Gemini), Azure OpenAI, AWS Bedrock
- 🎨 **Interface moderne** : Interface utilisateur inspirée de ChatGPT avec des améliorations
- 🔧 **Interpréteur de code** : Exécution sécurisée de code Python, Node.js, Go, Java, etc.
- 🔍 **Recherche web intégrée** : Recherche internet pour enrichir les réponses
- 🎨 **Génération d'images** : Support DALL-E, Stable Diffusion et autres
- 💾 **Presets personnalisés** : Créez et partagez vos configurations
- 🌍 **Multilingue** : Interface disponible en français et de nombreuses autres langues
- 🔒 **Authentification sécurisée** : Support OAuth2, LDAP et authentification par email
- 📱 **Interface responsive** : Optimisée pour desktop et mobile

### Configuration

Ce module nécessite une base de données MongoDB qui est automatiquement configurée. Vous pouvez personnaliser les paramètres suivants :

- **Nom d'utilisateur MongoDB** : Nom d'utilisateur pour la base de données
- **Mot de passe MongoDB** : Mot de passe pour la base de données
- **Journalisation debug** : Activer les logs détaillés pour le débogage
- **Vérification du solde** : Vérifier le solde des API utilisées
- **Secrets JWT** : Clés de sécurité pour l'authentification (générées automatiquement)

### Configuration des modèles IA

Pour utiliser LibreChat avec vos modèles IA préférés, vous devrez configurer les clés API dans l'interface web après l'installation. Rendez-vous dans les paramètres pour ajouter vos clés API pour :

- OpenAI (GPT-4, GPT-3.5-turbo, etc.)
- Anthropic (Claude)
- Google (Gemini Pro)
- Azure OpenAI
- Et bien d'autres...

### Accès

Une fois installé, LibreChat sera accessible via l'interface web Home Assistant ou directement à l'adresse :
`http://[VOTRE_IP_HOME_ASSISTANT]:3080`

### Support et documentation

- Documentation officielle : [librechat.ai/docs](https://librechat.ai/docs)
- Dépôt GitHub : [github.com/danny-avila/LibreChat](https://github.com/danny-avila/LibreChat)
- Site web : [librechat.ai](https://librechat.ai)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg 