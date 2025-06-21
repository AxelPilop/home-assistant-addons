# Guide d'installation LibreChat pour Home Assistant

## 🚀 Installation pas à pas

### Prérequis
- Home Assistant avec Supervisor
- Accès aux modules complémentaires
- Connexion internet stable

### 1. Ajouter le dépôt

1. Allez dans **Paramètres** → **Modules complémentaires**
2. Cliquez sur **Boutique des modules complémentaires**
3. Cliquez sur les **trois points** (⋮) en haut à droite
4. Sélectionnez **Dépôts**
5. Ajoutez cette URL : `https://github.com/axel-vair/home-assistant-addons`
6. Cliquez sur **Ajouter**

### 2. Installer l'addon

1. Recherchez **"LibreChat"** dans la boutique
2. Cliquez sur l'addon **LibreChat**
3. Cliquez sur **INSTALLER**
4. Attendez la fin du téléchargement et de la construction

✅ **Optimisé** : L'addon utilise l'image Docker officielle de LibreChat, installation rapide !

### 3. Configuration de base

Avant de démarrer, configurez au minimum :

```yaml
mongodb_url: ""  # Optionnel, utilise MongoDB intégré si vide
jwt_secret: ""  # Laissez vide pour génération automatique
openai_api_key: "sk-votre-clé-ici"  # Optionnel
debug_logging: false
```

### 4. Premier démarrage

1. Cliquez sur **DÉMARRER**
2. Attendez 2-3 minutes que tous les services se lancent
3. Surveillez les logs pour détecter d'éventuelles erreurs
4. Une fois prêt, cliquez sur **OUVRIR L'INTERFACE WEB**

## 🔧 Résolution des problèmes courants

### Erreur "Can't install image"

**Symptôme** : `Can't install ghcr.io/axel-vair/addon-librechat-amd64:1.0.0`

**Solution** : Cette erreur est maintenant corrigée. L'addon utilise l'image Docker officielle de LibreChat.

### L'addon ne démarre pas

**Vérifications** :
1. Consultez les logs de l'addon
2. Vérifiez que le port 3080 n'est pas utilisé par un autre service
3. Assurez-vous d'avoir suffisamment d'espace disque (minimum 2GB)

### MongoDB ne démarre pas

**Solutions** :
1. Redémarrez l'addon
2. Vérifiez les logs MongoDB dans l'onglet "Journal"
3. Si persistant, utilisez une base MongoDB externe

### LibreChat inaccessible

**Vérifications** :
1. Attendez 2-3 minutes après le démarrage
2. Vérifiez les logs LibreChat
3. Testez l'accès direct : `http://your-ha-ip:3080`

## 📊 Surveillance

### Logs utiles

```bash
# Logs généraux de l'addon
docker logs addon_librechat

# Logs MongoDB spécifiques
docker exec addon_librechat tail -f /var/log/mongodb/mongodb.log

# Logs LibreChat
docker exec addon_librechat tail -f /app/logs/error.log
```

### Health check

L'addon inclut un système de surveillance automatique qui vérifie :
- ✅ MongoDB (port 27017)
- ✅ LibreChat API (port 3080)

## 🔑 Configuration avancée

### Fichier librechat.yaml

Créez `/share/librechat/librechat.yaml` pour une configuration avancée :

```yaml
version: 1.0.9
cache: true
registration:
  allowedDomains: ["votre-domaine.com"]
endpoints:
  openAI:
    apiKey: "sk-votre-clé"
  anthropic:
    apiKey: "sk-ant-votre-clé"
```

### Clés API supportées

- **OpenAI** : GPT-3.5, GPT-4, DALL-E
- **Anthropic** : Claude 3
- **Google** : Gemini Pro
- **Azure OpenAI** : Via configuration YAML

## 🆕 Première utilisation

1. **Accédez à l'interface** : `http://votre-ha-ip:3080`
2. **Créez un compte** : Premier utilisateur = administrateur
3. **Choisissez un modèle** : Selon vos clés API configurées
4. **Testez** : Envoyez votre premier message !

## 🎯 Conseils d'optimisation

### Performance
- Activez le cache dans `librechat.yaml`
- Utilisez une base MongoDB externe pour de meilleures performances
- Limitez le nombre de fichiers uploadés simultanément

### Sécurité
- Changez le JWT secret par défaut
- Limitez les domaines autorisés pour l'inscription
- Utilisez HTTPS avec un proxy inverse

### Ressources
- **RAM minimum** : 2GB
- **Stockage minimum** : 5GB
- **CPU** : 2 cœurs recommandés

## 📞 Support

En cas de problème :

1. **Consultez les logs** de l'addon
2. **Vérifiez la configuration** MongoDB et clés API
3. **Redémarrez l'addon** si nécessaire
4. **Ouvrez une issue** sur GitHub avec les logs

---

*Addon créé avec ❤️ pour la communauté Home Assistant* 