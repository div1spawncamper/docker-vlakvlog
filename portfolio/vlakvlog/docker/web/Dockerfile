# Base image
FROM nginx

# Install dependencies
RUN apt-get update -qq && apt-get -y install apache2-utils

# Establecer dónde Nginx debe buscar los archivos
ENV RAILS_ROOT /var/www/app

# Establecer nuestro directorio de trabajo dentro de la imagen
WORKDIR $RAILS_ROOT

# Crear directorio de registros
RUN mkdir log

# Copiar activos estáticos
COPY public public/

# Copiar la plantilla de configuración de Nginx
COPY docker/web/nginx.conf /tmp/docker.nginx

# Sustituir las referencias de variables en la plantilla de configuración de Nginx por valores reales del entorno
# Colocar la configuración final en su lugar
RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

# Exponer el puerto 80
EXPOSE 80

# Usar la forma "exec" de CMD para que Nginx se apague de manera adecuada en SIGTERM (es decir, `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
