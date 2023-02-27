# Utilisez l'image Node.js 16
FROM node:16-alpine

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier package.json et package-lock.json pour installer les dépendances
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste du code source
COPY . .

# Construire l'application pour la production
RUN npm run build

# Exposer le port 3000 pour l'application
EXPOSE 3000

# Démarrer l'application avec le port 8080 et le paramètre --host
CMD ["npm", "run", "preview", "--", "--port", "3000", "--host", "0.0.0.0"]