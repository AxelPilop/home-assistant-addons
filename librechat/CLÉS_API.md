# Guide : Ajouter des clés API à LibreChat

## 🚀 Installation terminée ? Ajoutez vos clés API !

Votre LibreChat fonctionne avec MongoDB intégré. Pour utiliser les modèles d'IA, ajoutez vos clés API :

## Méthode 1 : Via l'interface LibreChat (Recommandée)

1. **Accédez à LibreChat** : `http://votre-ha-ip:3080`
2. **Créez un compte** (premier utilisateur = admin)
3. **Allez dans Paramètres** → **Modèles**
4. **Ajoutez vos clés API** directement dans l'interface

## Méthode 2 : Via fichier de configuration

Créez `/share/librechat/librechat.yaml` :

```yaml
version: 1.0.9

# Configuration des endpoints
endpoints:
  openAI:
    apiKey: "sk-votre-clé-openai-ici"
    models:
      default: ["gpt-3.5-turbo", "gpt-4"]
      
  anthropic:
    apiKey: "sk-ant-votre-clé-anthropic-ici"
    models:
      default: ["claude-3-sonnet-20240229"]
      
  google:
    apiKey: "votre-clé-google-ici"
    models:
      default: ["gemini-pro"]

# Configuration optionnelle
registration:
  allowedDomains: []  # Vide = ouvert à tous
  
fileConfig:
  endpoints:
    openAI:
      fileLimit: 20
      fileSizeLimit: 100  # MB
```

## Méthode 3 : Via variables d'environnement Home Assistant

Dans la configuration de l'addon, ajoutez :

```yaml
environment:
  OPENAI_API_KEY: "sk-votre-clé-openai"
  ANTHROPIC_API_KEY: "sk-ant-votre-clé-anthropic" 
  GOOGLE_API_KEY: "votre-clé-google"
```

## 🔑 Où obtenir les clés API ?

- **OpenAI** : https://platform.openai.com/api-keys
- **Anthropic** : https://console.anthropic.com/
- **Google** : https://makersuite.google.com/app/apikey

## 🔄 Redémarrage

Après avoir ajouté des clés API :
1. **Redémarrez l'addon** LibreChat
2. **Vérifiez les logs** pour s'assurer qu'il n'y a pas d'erreurs
3. **Testez les modèles** dans l'interface

## ✅ C'est tout !

Votre LibreChat est maintenant prêt avec toutes vos IA préférées ! 🎉 