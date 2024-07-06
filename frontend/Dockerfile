# Utiliser une image officielle de Node.js pour construire l'application
FROM node:18 AS build-stage

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et yarn.lock dans le conteneur
COPY package.json yarn.lock ./

# Installer les dépendances
RUN yarn install

# Copier le reste des fichiers de l'application dans le conteneur
COPY . .

# Ajouter des variables d'environnement pour le build
ARG REACT_APP_API_URL
ENV REACT_APP_API_URL=${REACT_APP_API_URL}

# Construire l'application
RUN yarn build

# Nettoyer les dépendances de développement pour réduire la taille de l'image
RUN yarn install --production --ignore-scripts --prefer-offline

# Étape 2 : Utiliser une image officielle de NGINX pour servir l'application
FROM nginx:alpine

# Copier les fichiers de build dans le répertoire HTML de NGINX
COPY --from=build-stage /app/build /usr/share/nginx/html

# Copier le fichier de configuration NGINX personnalisé
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exposer le port utilisé par NGINX
EXPOSE 80

# Définir les variables d'environnement pour NGINX
ENV NGINX_ENTRYPOINT_QUIET_LOGS=1

# Démarrer NGINX
CMD ["nginx", "-g", "daemon off;"]