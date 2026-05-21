# ---- Stage 1: Build React app (producción) ----

FROM node:20-alpine AS build

WORKDIR /app

# Instalar dependencias
COPY package.json package-lock.json ./
RUN npm ci

# Copiar todo el código fuente
COPY . .

# Build de producción (inyectar las URLs de backend via build args)
ARG VITE_API_VENTAS_URL=http://localhost:8080
ARG VITE_API_DESPACHOS_URL=http://localhost:8081
ENV VITE_API_VENTAS_URL=$VITE_API_VENTAS_URL
ENV VITE_API_DESPACHOS_URL=$VITE_API_DESPACHOS_URL

RUN npm run build

# ---- Stage 2: Nginx para servir ----
FROM nginx:alpine

# Copiar el build de React
COPY --from=build /app/dist /usr/share/nginx/html

# Configuración de Nginx con proxy inverso a los backends
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
