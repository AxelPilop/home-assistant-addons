# Images manquantes pour l'addon LibreChat

Ce dossier a besoin des images suivantes :

## icon.png
- **Source recommandée** : [Favicon LibreChat](https://raw.githubusercontent.com/danny-avila/LibreChat/main/client/public/favicon-32x32.png)
- **Taille** : 32x32 pixels minimum
- **Format** : PNG avec transparence
- **Usage** : Icône de l'addon dans Home Assistant

## logo.png
- **Source recommandée** : [Logo LibreChat](https://raw.githubusercontent.com/danny-avila/LibreChat/main/docs/assets/LibreChat.png)
- **Taille** : 256x256 pixels recommandé
- **Format** : PNG avec transparence
- **Usage** : Logo affiché dans la documentation et interface

## logo.svg (optionnel)
- **Source recommandée** : Logo vectoriel LibreChat
- **Format** : SVG
- **Usage** : Version vectorielle du logo

## Téléchargement automatique

Vous pouvez télécharger ces images automatiquement avec :

```bash
# Télécharger l'icône
curl -o icon.png "https://raw.githubusercontent.com/danny-avila/LibreChat/main/client/public/favicon-32x32.png"

# Télécharger le logo
curl -o logo.png "https://raw.githubusercontent.com/danny-avila/LibreChat/main/docs/assets/LibreChat.png"
```

Une fois les images téléchargées, vous pouvez supprimer ce fichier. 