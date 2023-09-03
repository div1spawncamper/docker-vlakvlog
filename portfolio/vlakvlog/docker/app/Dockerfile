# Utiliza una imagen de Ruby como base
FROM ruby:3.2.2

# Instala dependencias necesarias
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libvips libvips-dev
RUN gem install bundler

# Setea una variable de entorno para la ubicación de la aplicación Rails dentro de la imagen Docker
ENV RAILS_ROOT /var/www/app
RUN mkdir -p $RAILS_ROOT

# Establece el directorio de trabajo
WORKDIR $RAILS_ROOT

# Configura las variables de entorno para el entorno de Rails
ENV RAILS_ENV development
ENV RACK_ENV development

# Copia el archivo Gemfile y Gemfile.lock para instalar las gemas
COPY portfolio/vlakvlog/Gemfile portfolio/vlakvlog/Gemfile.lock $RAILS_ROOT/
RUN bundle install --jobs 20 --retry 5 --without development test

# Copia wait-for-it.sh al contenedor
# Copia los archivos de la aplicación
COPY . $RAILS_ROOT
COPY portfolio/vlakvlog/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
COPY portfolio/vlakvlog/docker/app/wait-for-it.sh /usr/bin/wait-for-it
RUN chmod +x /usr/bin/wait-for-it

#RUN chmod +x /usr/bin/wait-for-it



# Ejecuta las tareas de precompilación de assets
#RUN bundle exec rake assets:precompile --trace

# Agrega un comando para esperar antes de iniciar la aplicación
CMD bash -c "sleep 2 && bundle exec puma -C config/puma.rb"

# Expone el puerto en el que se ejecuta la aplicación Rails (puerto 3000)
EXPOSE 3000
