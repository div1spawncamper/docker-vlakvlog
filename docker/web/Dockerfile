```Dockerfile
# Base image
FROM nginx

# Install dependencies
RUN apt-get update -qq && apt-get -y install apache2-utils

# Set where Nginx should look for files
ENV RAILS_ROOT /var/www/app

# Set our working directory within the image
WORKDIR $RAILS_ROOT

# Create log directory
RUN mkdir log

# Copy static assets
COPY ./public public/

# Copy Nginx configuration template
COPY ./docker/web/nginx.conf /tmp/docker.nginx

# Replace variable references in Nginx configuration template with actual environment values
# Place the final configuration in its place
RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Use the "exec" form of CMD so that Nginx shuts down properly on SIGTERM (i.e., `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
```
