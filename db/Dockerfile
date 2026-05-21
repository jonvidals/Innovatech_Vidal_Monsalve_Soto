FROM mysql:8.0

# Variables de entorno por defecto (sobreescribibles en el contenedor)
ENV MYSQL_ROOT_PASSWORD=admin123
ENV MYSQL_DATABASE=innovatech

# Copiar el script de inicialización
COPY init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306
