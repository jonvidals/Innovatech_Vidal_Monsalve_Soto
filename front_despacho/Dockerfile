# STAGE 1: Compilación de Angular
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# STAGE 2: Servidor Nginx liviano
FROM nginx:alpine
# Copiamos los archivos compilados. OJO: Si Angular genera una subcarpeta dentro de dist (ej: dist/frontend), ajusta esta línea.
COPY --from=build /app/dist/frontend /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]