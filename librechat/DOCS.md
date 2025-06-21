# Documentation du module complémentaire LibreChat

## Installation et configuration

### Prérequis

- Home Assistant supervisé
- Accès à internet pour télécharger les modèles IA
- Clés API pour les services IA souhaités (optionnel)

### Installation étape par étape

1. **Ajouter le dépôt**
   - Allez dans "Modules complémentaires" > "Boutique des modules complémentaires"
   - Cliquez sur les trois points en haut à droite > "Dépôts"
   - Ajoutez l'URL : `https://github.com/axel-vair/home-assistant-addons`

2. **Installer l'addon**
   - Recherchez "LibreChat" dans la boutique
   - Cliquez sur "INSTALLER"

3. **Configuration de base**
   - Allez dans l'onglet "Configuration" de l'addon
   - Configurez au minimum :
     - `jwt_secret` : Laissez vide pour génération automatique
     - `openai_api_key` : Votre clé API OpenAI (si vous l'utilisez)

4. **Démarrage**
   - Cliquez sur "DÉMARRER"
   - Attendez que l'addon soit entièrement démarré
   - Cliquez sur "OUVRIR L'INTERFACE WEB"

## Configuration avancée

### Base de données MongoDB

Par défaut, l'addon utilise une base de données MongoDB intégrée. Pour utiliser une base externe :

```yaml
mongodb_url: "mongodb://votre-host:27017/LibreChat"
```

### Configuration personnalisée

Créez un fichier `/share/librechat/librechat.yaml` pour une configuration avancée :

```yaml
version: 1.0.9
cache: true
fileStrategy: "local"
registration:
  socialLogins: []
  allowedDomains: []
endpoints:
  custom:
    - name: "Mon Modèle Local"
      apiKey: "sk-fake-key"
      baseURL: "http://localhost:1234/v1"
      models:
        default: ["gpt-3.5-turbo"]
        fetch: false
      titleConvo: true
      titleModel: "gpt-3.5-turbo"
      summarize: false
      summaryModel: "gpt-3.5-turbo"
      forcePrompt: false
      modelDisplayLabel: "Mon Modèle"
```

### Clés API supportées

L'addon supporte les fournisseurs d'IA suivants :

- **OpenAI** : `openai_api_key`
- **Anthropic** : `anthropic_api_key`  
- **Google** : `google_api_key`
- **Azure OpenAI** : Configuration via librechat.yaml
- **Hugging Face** : Configuration via librechat.yaml
- **Cohere** : Configuration via librechat.yaml

### Options de sécurité

- **JWT Secret** : Utilisé pour signer les tokens d'authentification
- **Inscription** : Désactivée par défaut, activable via la configuration
- **Authentification** : Système d'authentification intégré

## Utilisation

### Premier démarrage

1. Accédez à l'interface web
2. Créez un compte utilisateur
3. Choisissez votre modèle d'IA préféré
4. Commencez à chatter !

### Fonctionnalités avancées

- **Upload de fichiers** : Glissez-déposez des documents pour les analyser
- **Génération d'images** : Utilisez DALL-E ou Stable Diffusion
- **Code Interpreter** : Exécutez du code Python directement
- **Recherche web** : Activez la recherche en temps réel
- **Presets** : Créez des configurations de prompt personnalisées

## Résolution des problèmes

### L'addon ne démarre pas

1. Vérifiez les logs de l'addon
2. Assurez-vous que le port 3080 n'est pas utilisé
3. Vérifiez la configuration MongoDB

### Problèmes de clés API

1. Vérifiez que vos clés API sont valides
2. Contrôlez les quotas de votre compte API
3. Vérifiez la syntaxe dans la configuration

### Performance lente

1. Activez le cache dans librechat.yaml
2. Utilisez une base MongoDB externe
3. Augmentez les ressources allouées à l'addon

## Mise à jour

L'addon se met à jour automatiquement quand une nouvelle version est disponible. Pour forcer une mise à jour :

1. Arrêtez l'addon
2. Cliquez sur "Mettre à jour" si disponible
3. Redémarrez l'addon

## Sauvegarde et restauration

Les conversations et configurations sont automatiquement sauvegardées avec Home Assistant. Pour une sauvegarde manuelle :

1. Exportez vos conversations depuis l'interface LibreChat
2. Sauvegardez votre fichier `librechat.yaml` si utilisé
3. Notez vos clés API (non sauvegardées pour sécurité)

## Support et communauté

- [Documentation officielle LibreChat](https://www.librechat.ai/docs)
- [Discord LibreChat](https://discord.gg/weqZFtD9C4)
- [Issues GitHub](https://github.com/axel-vair/home-assistant-addons/issues)
- [Forum Home Assistant](https://community.home-assistant.io/) 