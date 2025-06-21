# LibreChat - Add-on Home Assistant

Clone amélioré de ChatGPT avec support multi-modèles IA incluant OpenAI, Anthropic (Claude), Google (Gemini), Azure OpenAI et bien d'autres.

![LibreChat Interface](https://github.com/danny-avila/LibreChat/raw/main/docs/assets/LibreChat.gif)

## À propos

LibreChat est une plateforme de chat IA complète qui réunit les technologies d'assistant IA les plus avancées. Cette version est spécialement configurée pour Home Assistant.

### Fonctionnalités principales

- 🤖 **Support multi-modèles** : OpenAI GPT-4, Claude, Gemini, Azure OpenAI, etc.
- 🎨 **Interface moderne** inspirée de ChatGPT avec des améliorations
- 💬 **Chat multimodal** : texte, images, fichiers
- 🛠️ **Agents et outils** : Interpréteur de code, recherche web
- 🌍 **Interface multilingue** (français inclus)
- 👥 **Multi-utilisateur** avec authentification sécurisée
- 🔍 **Recherche** dans les conversations
- 📁 **Import/Export** des conversations

## Installation

1. Ajoutez ce dépôt à vos add-ons Home Assistant
2. Installez l'add-on "LibreChat"
3. Configurez vos clés API dans la configuration
4. Démarrez l'add-on
5. Accédez à l'interface via le panneau Web UI

## Configuration minimale

Ajoutez au moins une clé API dans la configuration de l'add-on :

```yaml
openai_api_key: "sk-..."
```

## Support

Pour plus d'informations, consultez la [documentation officielle LibreChat](https://librechat.ai/docs) et les [docs détaillées](DOCS.md) de cet add-on. 