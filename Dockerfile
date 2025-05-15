# Build-Phase
FROM node:20-alpine AS build

WORKDIR /app

# Umgebungsvariablen für NPM, die helfen können, Checksum-Fehler zu vermeiden
ENV NODE_ENV=development
ENV npm_config_loglevel=error

# Abhängigkeiten installieren mit Retry-Logik
COPY package.json package-lock.json* ./
RUN npm ci --no-audit --no-fund || npm ci --no-audit --no-fund || npm ci --no-audit --no-fund

# Quellcode kopieren und bauen
COPY . .
RUN npm run build

# Produktions-Phase
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
# Optional: Nginx-Konfiguration anpassen
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Port 80 freigeben
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]