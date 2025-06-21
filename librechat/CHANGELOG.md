# Changelog - LibreChat Add-on

Toutes les modifications notables de cet add-on seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/),
et ce projet adhère au [Versioning Sémantique](https://semver.org/lang/fr/).

## [1.0.0] - 2025-01-24

### Ajouté
- 🎉 **Version initiale** de l'add-on LibreChat pour Home Assistant
- 🤖 **Support multi-modèles IA** :
  - OpenAI (GPT-4, GPT-4 Turbo, GPT-3.5 Turbo, DALL-E 3)
  - Anthropic (Claude 3 Opus, Sonnet, Haiku)
  - Google (Gemini Pro, Gemini Pro Vision)
  - Azure OpenAI
- 🔐 **Configuration sécurisée** des clés API via l'interface Home Assistant
- 🗄️ **Base de données MongoDB intégrée** pour la persistance des données
- 🌐 **Interface web** accessible via ingress Home Assistant
- 👥 **Support multi-utilisateur** avec authentification
- 🛠️ **Configuration avancée** :
  - Paramètres de session et sécurité
  - Configuration email pour les notifications
  - Options de debug pour le développement
- 📖 **Documentation complète** en français
- 🔄 **Support des architectures** amd64 et aarch64

### Configuration par défaut
- Port : 3080
- Inscription autorisée : true (à désactiver après création des comptes)
- Expiration de session : 15 minutes
- Expiration token de rafraîchissement : 7 jours
- Debug désactivé par défaut

### Fonctionnalités LibreChat incluses
- Interface utilisateur moderne inspirée de ChatGPT
- Chat multimodal (texte, images, fichiers)
- Interpréteur de code sécurisé
- Agents et assistants IA
- Recherche web intégrée
- Import/Export des conversations
- Interface multilingue (français inclus)
- Recherche dans l'historique des conversations

## [Non publié]

### À venir
- 🔧 Support des endpoints personnalisés
- 🎨 Thèmes personnalisés Home Assistant
- 📊 Intégration des métriques dans Home Assistant
- 🔌 Support des plugins Home Assistant
- ☁️ Configuration cloud optionnelle
- 🔄 Mise à jour automatique des modèles

---

## Types de changements
- `Ajouté` pour les nouvelles fonctionnalités
- `Modifié` pour les changements dans les fonctionnalités existantes
- `Obsolète` pour les fonctionnalités bientôt supprimées
- `Supprimé` pour les fonctionnalités supprimées
- `Corrigé` pour les corrections de bugs
- `Sécurité` pour les vulnérabilités corrigées 