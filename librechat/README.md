# LibreChat Add-on pour Home Assistant

Cette add-on Home Assistant exécute LibreChat localement dans un conteneur dédié, incluant MongoDB pour la persistance des données.

## Installation

1. Copiez ce dossier dans `/addons/local/` de votre installation Home Assistant
2. Dans l'interface Home Assistant, allez dans **Configuration → Add-ons, Backups & Supervisor → Add-on Store**
3. Cliquez sur **Check for updates** pour faire apparaître la section « Local Add-ons »
4. Installez l'add-on « LibreChat »
5. Démarrez l'add-on

## Accès

Après le démarrage, l'interface LibreChat est accessible à l'adresse :
`http://<IP_Host>:3080`

## Persistance des données

L'add-on utilise le répertoire `/data` (persistant à chaque redémarrage) pour stocker :
- La base de données MongoDB (`/data/db`)
- Les fichiers uploadés (`/data/uploads`) 
- Les logs (`/data/logs`)

## Fonctionnalités

- Chat IA open-source avec interface web
- Base de données MongoDB intégrée
- Support RAG (Retrieval-Augmented Generation)
- MeiliSearch pour la recherche de fichiers
- Persistance complète des données et conversations 