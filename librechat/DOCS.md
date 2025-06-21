# Documentation LibreChat - Add-on Home Assistant

## Table des matières

- [Installation](#installation)
- [Configuration](#configuration)
- [Utilisation](#utilisation)
- [Fournisseurs d'IA supportés](#fournisseurs-dia-supportés)
- [Fonctionnalités avancées](#fonctionnalités-avancées)
- [Résolution des problèmes](#résolution-des-problèmes)

## Installation

### Prérequis

- Home Assistant OS/Supervised
- Au moins 2 GB de RAM disponible
- Une clé API d'au moins un fournisseur d'IA supporté

### Étapes d'installation

1. **Ajout du dépôt** :
   - Allez dans **Supervisor** > **Add-on Store**
   - Cliquez sur les **trois points** en haut à droite
   - Sélectionnez **Repositories**
   - Ajoutez : `https://github.com/AxelPilop/home-assistant-addons`

2. **Installation de l'add-on** :
   - Recherchez "LibreChat" dans le store
   - Cliquez sur **Install**
   - Attendez la fin de l'installation (cela peut prendre plusieurs minutes)

3. **Configuration initiale** :
   - Ajoutez au minimum une clé API (voir section Configuration)
   - Démarrez l'add-on
   - Ouvrez l'interface Web UI

## Configuration

### Options de base

#### Clés API des fournisseurs

```yaml
# Obligatoire : au moins une clé API
openai_api_key: "sk-proj-..." # OpenAI GPT-4, etc.
anthropic_api_key: "sk-ant-..." # Claude 3, etc.
google_api_key: "AIza..." # Gemini
azure_openai_api_key: "..." # Azure OpenAI
```

#### Authentification et sécurité

```yaml
allow_registration: true # Permettre l'inscription de nouveaux utilisateurs
session_expiry: 900 # Durée de session en secondes (15 min)
refresh_token_expiry: 604800 # Durée du token de rafraîchissement (7 jours)
```

#### Options de débogage

```yaml
debug_logging: false # Logging détaillé
debug_openai: false # Debug spécifique OpenAI
debug_plugins: false # Debug des plugins
```

### Configuration avancée

#### Service Email (optionnel)

Pour l'envoi d'emails de confirmation :

```yaml
email_service: "gmail" # gmail, mailgun, sendgrid, custom
email_username: "votre@email.com"
email_password: "mot_de_passe_application"
email_from: "LibreChat <noreply@votredomaine.com>"
```

#### Exemple de configuration complète

```yaml
# Clés API principales
openai_api_key: "sk-proj-abcd1234..."
anthropic_api_key: "sk-ant-efgh5678..."
google_api_key: "AIzaSyABCD..."

# Configuration utilisateur
allow_registration: false # Désactiver après création des comptes
session_expiry: 3600 # 1 heure
refresh_token_expiry: 2592000 # 30 jours

# Email (optionnel)
email_service: "gmail"
email_username: "librechat@mondomaine.com"
email_password: "motdepasseapp"
email_from: "LibreChat <librechat@mondomaine.com>"

# Debug (pour le développement uniquement)
debug_logging: false
debug_openai: false
debug_plugins: false
```

## Utilisation

### Première connexion

1. Ouvrez l'interface Web UI depuis Home Assistant
2. Créez un compte utilisateur (si `allow_registration: true`)
3. Connectez-vous avec vos identifiants
4. Sélectionnez un modèle d'IA dans le menu déroulant
5. Commencez à chatter !

### Interface utilisateur

L'interface LibreChat est similaire à ChatGPT avec des fonctionnalités supplémentaires :

- **Sélection de modèle** : Menu déroulant en haut pour changer de modèle
- **Paramètres avancés** : Température, max tokens, etc.
- **Historique** : Toutes vos conversations sont sauvegardées
- **Recherche** : Fonction de recherche dans l'historique
- **Export** : Téléchargement des conversations

### Navigation

- **Nouvelle conversation** : Bouton "+" ou Ctrl/Cmd + N
- **Historique** : Panel de gauche avec toutes les conversations
- **Paramètres** : Icône d'engrenage pour la configuration
- **Profil utilisateur** : Menu en haut à droite

## Fournisseurs d'IA supportés

### OpenAI
- **Modèles** : GPT-4, GPT-4 Turbo, GPT-3.5 Turbo, DALL-E 3
- **Fonctionnalités** : Chat, images, code, assistants API
- **Configuration** : `openai_api_key`

### Anthropic (Claude)
- **Modèles** : Claude 3 Opus, Sonnet, Haiku
- **Fonctionnalités** : Chat avancé, analyse de documents
- **Configuration** : `anthropic_api_key`

### Google (Gemini)
- **Modèles** : Gemini Pro, Gemini Pro Vision
- **Fonctionnalités** : Chat multimodal, analyse d'images
- **Configuration** : `google_api_key`

### Azure OpenAI
- **Modèles** : Identiques à OpenAI mais hébergés sur Azure
- **Configuration** : `azure_openai_api_key` + configuration endpoint

### Autres fournisseurs

LibreChat supporte également :
- AWS Bedrock
- Cohere
- Mistral AI
- Groq
- Ollama (modèles locaux)
- Et bien d'autres via l'API Custom Endpoints

## Fonctionnalités avancées

### Interpréteur de code

LibreChat peut exécuter du code Python de manière sécurisée :

1. Activez l'interpréteur dans les paramètres
2. Demandez à l'IA d'écrire et d'exécuter du code
3. Visualisez les résultats directement dans le chat

### Agents et assistants

- **Agents personnalisés** : Créez des assistants spécialisés
- **API Assistants OpenAI** : Support complet des assistants OpenAI
- **Outils** : Intégration de fonctions personnalisées

### Recherche Web

Activez la recherche web pour permettre à l'IA d'accéder à des informations récentes.

### Upload de fichiers

- **Images** : Analyse et traitement d'images
- **Documents** : PDF, Word, texte
- **Code** : Analyse et débogage de code

## Résolution des problèmes

### L'add-on ne démarre pas

1. **Vérifiez les logs** dans l'onglet "Log" de l'add-on
2. **Ressources insuffisantes** : Assurez-vous d'avoir au moins 2GB de RAM
3. **Configuration invalide** : Vérifiez la syntaxe YAML de votre configuration

### Erreurs de clé API

```
Error: Invalid API key
```

- Vérifiez que votre clé API est correcte et active
- Assurez-vous d'avoir des crédits disponibles
- Respectez le format exact de la clé

### Problème de connexion MongoDB

```
Error: Failed to connect to MongoDB
```

- Redémarrez l'add-on
- Vérifiez l'espace disque disponible
- Consultez les logs pour plus de détails

### Interface Web inaccessible

1. **Vérifiez le port** : L'add-on utilise le port 3080
2. **Ingress activé** : Utilisez le bouton "Open Web UI" de Home Assistant
3. **Proxy/Firewall** : Vérifiez les règles de votre réseau

### Performance lente

- **Ressources** : Augmentez la RAM allouée à Home Assistant
- **Modèles** : Utilisez des modèles plus rapides (GPT-3.5 vs GPT-4)
- **Historique** : Nettoyez l'historique si trop volumineux

## Support et communauté

### Ressources officielles

- **Site Web** : [librechat.ai](https://librechat.ai)
- **Documentation** : [librechat.ai/docs](https://librechat.ai/docs)
- **GitHub** : [github.com/danny-avila/LibreChat](https://github.com/danny-avila/LibreChat)

### Contribution

Ce add-on est basé sur le projet open-source LibreChat. Pour contribuer :

1. Consultez le [dépôt principal](https://github.com/danny-avila/LibreChat)
2. Rejoignez la [communauté Discord](https://discord.gg/librechat)
3. Reportez les bugs sur GitHub

### Mises à jour

L'add-on sera mis à jour régulièrement pour suivre les versions de LibreChat. Consultez le changelog pour les nouveautés.

---

**Note** : LibreChat est un projet en développement actif. Certaines fonctionnalités peuvent évoluer ou être ajoutées dans les futures versions. 