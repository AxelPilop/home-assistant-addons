ARG BUILD_FROM
FROM ${BUILD_FROM}

# Installer Node.js, MongoDB, Python (RAG) et nettoyages
RUN apt-get update && apt-get install -y \
    nodejs npm mongodb python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Copier le code LibreChat dans /app
COPY . /app
WORKDIR /app

# Installer les dépendances Node
RUN npm install

# Ajouter le script de démarrage
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ] 