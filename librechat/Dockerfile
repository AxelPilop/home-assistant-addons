ARG BUILD_FROM
FROM $BUILD_FROM

# Définir les variables d'environnement
ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    curl \
    git \
    build-essential \
    python3 \
    python3-pip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Installer Node.js 18.x
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Installer MongoDB
RUN wget -qO - https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg \
    && echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list \
    && apt-get update \
    && apt-get install -y mongodb-org \
    && rm -rf /var/lib/apt/lists/*

# Créer le répertoire de travail
WORKDIR /app

# Cloner LibreChat
RUN git clone https://github.com/danny-avila/LibreChat.git . \
    && git checkout main

# Installer les dépendances npm
RUN npm ci --only=production

# Créer les répertoires nécessaires
RUN mkdir -p /data/db /var/log/mongodb /data/logs \
    && chown -R mongodb:mongodb /data/db /var/log/mongodb

# Construire l'application
RUN npm run build

# Copier les fichiers de configuration
COPY run.sh /app/run.sh
COPY librechat.yaml /app/librechat.yaml

# Rendre le script exécutable
RUN chmod +x /app/run.sh

# Exposer le port
EXPOSE 3080

# Créer un utilisateur non-root
RUN useradd -m -s /bin/bash librechat

# Définir les volumes
VOLUME ["/data/db", "/data/logs"]

# Commande de démarrage
CMD ["/app/run.sh"] 