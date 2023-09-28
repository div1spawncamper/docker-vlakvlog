# Docker-vlakvlog

Dockerized version of vlakvlog
## Quick Start
1. Clone the repository:
   ```
   git clone https://github.com/div1spawncamper/docker-vlakvlog.git
   ```
2. Navigate to the project directory:
   ```
   cd docker-vlakvlog
   ```

3. Run the Docker Compose Hub file:
   ```
   docker-compose -f docker-compose-hub.yml up
   ```
## Docker compose file

```yaml
version: '3'

networks:
  my_network:
    driver: bridge

volumes:
  postgres_data:
  app_data:

services:
  app:
    image: div1spawncamper/vlakvlog-app:0.0.3  # Dockerhub image
    environment:
      - RAILS_ENV=development
    entrypoint: ["/usr/bin/entrypoint.sh"]
    depends_on:
      - db
    volumes:
      - app_data:/var/www/app/public
    networks:
      - my_network

  db:
    image: postgres
    environment:
      POSTGRES_PASSWORD: vlak1
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - my_network

  web:
    image: div1spawncamper/vlakvlog-nginx:0.0.3  # Dockerhub image
    depends_on:
      - app
      - db
    ports:
      - 80:80
    networks:
      - my_network
```
# Uses

Vlakvlog:<br>
Rails: The main web framework used for the application. <br>
OmniAuth: For OAuth-based authentication.<br>
Rolify: Role management library.<br>
Devise: For user authentication.<br>
Administrate: For creating admin dashboards.<br>
CanCanCan: Authorization library.<br>
pg: PostgreSQL database adapter for Active Record.<br>
Puma: Web server for the application.<br>

Nginx:<br>
Default config for reverse proxy pointing at 127.0.0.1 and port 3000<br>

postgreSQL:<br>
Host: db<br>
Database name: vlakvlog_development<br>
Database username: postgres<br>
Database password: vlak1<br>

This will pull the necessary images from Docker Hub and start the application. The blog should now be accessible at `http://localhost` port `80`. 

To access administrate dashboard, visit `http://localhost/admin`



