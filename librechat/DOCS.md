# Documentation LibreChat - Module Home Assistant

## Configuration du module

### Options de base

#### Base de données MongoDB
- `mongo_initdb_root_username` : Nom d'utilisateur administrateur MongoDB (défaut: librechat)
- `mongo_initdb_root_password` : Mot de passe administrateur MongoDB (défaut: password)

#### Journalisation
- `debug_logging` : Active les logs détaillés pour le débogage (défaut: false)

#### API et sécurité
- `check_balance` : Vérifie le solde des API utilisées (défaut: false)
- `jwt_secret` : Clé secrète pour les tokens JWT (généré automatiquement)
- `jwt_refresh_secret` : Clé secrète pour les tokens de rafraîchissement (généré automatiquement)
- `creds_key` : Clé de chiffrement des identifiants (généré automatiquement)
- `creds_iv` : Vecteur d'initialisation pour le chiffrement (généré automatiquement)

## Configuration post-installation

### Première connexion

1. Accédez à LibreChat via l'URL : `http://[VOTRE_IP]:3080`
2. Créez votre premier compte administrateur
3. Configurez vos clés API dans les paramètres

### Configuration des modèles IA

#### OpenAI
1. Allez dans Paramètres > Endpoints
2. Activez OpenAI
3. Ajoutez votre clé API OpenAI
4. Configurez les modèles disponibles (GPT-4, GPT-3.5-turbo, etc.)

#### Anthropic (Claude)
1. Activez l'endpoint Anthropic
2. Ajoutez votre clé API Anthropic
3. Configurez les modèles Claude disponibles

#### Google (Gemini)
1. Activez l'endpoint Google
2. Configurez votre projet Google Cloud
3. Ajoutez les identifiants API

#### Azure OpenAI
1. Activez l'endpoint Azure OpenAI
2. Configurez l'URL de votre endpoint Azure
3. Ajoutez les clés API et identifiants

### Configuration avancée

#### Variables d'environnement personnalisées

Vous pouvez ajouter des variables d'environnement supplémentaires en créant un fichier `.env` dans le dossier de configuration :

```env
# Exemple de configuration personnalisée
OPENAI_API_KEY=votre_cle_openai
ANTHROPIC_API_KEY=votre_cle_anthropic
GOOGLE_API_KEY=votre_cle_google

# Configuration de l'interface
TITLE=Mon LibreChat Personnel
CUSTOM_FOOTER=Powered by Home Assistant

# Configuration des limites
MESSAGE_LIMIT=100
CONVERSATION_LIMIT=50
```

#### Configuration librechat.yaml

Créez un fichier `librechat.yaml` dans le dossier de configuration pour une configuration avancée :

```yaml
version: 1.0.5
cache: true

endpoints:
  custom:
    - name: "OpenAI Local"
      apiKey: "${OPENAI_API_KEY}"
      baseURL: "https://api.openai.com/v1"
      models:
        default: ["gpt-4", "gpt-3.5-turbo"]
        
  anthropic:
    apiKey: "${ANTHROPIC_API_KEY}"
    models: ["claude-3-opus", "claude-3-sonnet"]

registration:
  socialLogins: ["google", "github"]
  
interface:
  privacyPolicy:
    externalUrl: "https://votre-site.com/privacy"
```

## Fonctionnalités avancées

### Interpréteur de code
- Exécution sécurisée de code Python, JavaScript, etc.
- Upload et traitement de fichiers
- Génération de graphiques et visualisations

### Recherche web
- Configuration des moteurs de recherche
- Scraping de contenu web
- Enrichissement des réponses avec des informations actuelles

### Génération d'images
- DALL-E 2/3 via OpenAI
- Stable Diffusion via endpoints personnalisés
- Modification d'images existantes

### Agents et outils
- Création d'assistants personnalisés
- Intégration d'outils externes
- Workflows automatisés

## Dépannage

### Problèmes courants

#### LibreChat ne démarre pas
1. Vérifiez les logs du module
2. Assurez-vous que MongoDB est bien démarré
3. Vérifiez les variables d'environnement

#### Erreurs de base de données
1. Redémarrez le module complémentaire
2. Vérifiez les identifiants MongoDB
3. Consultez les logs MongoDB

#### Problèmes d'API
1. Vérifiez vos clés API
2. Contrôlez les quotas et limites
3. Testez la connectivité réseau

### Logs et diagnostics

Activez `debug_logging: true` dans la configuration pour obtenir des logs détaillés.

Les logs sont accessibles via :
- Interface Home Assistant > Supervisor > Module LibreChat > Logs
- Ligne de commande : `ha addons logs librechat`

## Mise à jour

Le module se met à jour automatiquement avec les nouvelles versions de LibreChat. Surveillez les annonces de mise à jour dans Home Assistant.

## Sécurité

- Utilisez des mots de passe forts pour MongoDB
- Gardez vos clés API secrètes
- Activez l'authentification à deux facteurs si disponible
- Limitez l'accès réseau si nécessaire

## Support

- Documentation officielle : [librechat.ai/docs](https://librechat.ai/docs)
- Communauté : [GitHub Discussions](https://github.com/danny-avila/LibreChat/discussions)
- Issues : [GitHub Issues](https://github.com/danny-avila/LibreChat/issues) 