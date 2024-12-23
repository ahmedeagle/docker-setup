# Laravel Docker Setup

## Overview
This project demonstrates how to set up a Laravel application with Docker, integrating essential services like MySQL, Redis, and Nginx. It uses Docker Compose to orchestrate the environment, making development, testing, and deployment consistent and straightforward.

---

## Prerequisites
- Docker and Docker Compose installed on your machine.
- A `.env` file configured for the Laravel application.
- Basic familiarity with Docker and Laravel.

---

## Setup Instructions

### 1. Clone the Repository
```bash
git clone <repository_url>
cd <repository_folder>
```

### 2. Configure Environment Variables
Ensure the `.env` file is properly configured for Laravel and Docker:

**.env Example:**
```env
APP_ENV=local
APP_DEBUG=true
APP_KEY=base64:YOUR_APP_KEY

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel_db
DB_USERNAME=laravel_user
DB_PASSWORD=secure_password

QUEUE_CONNECTION=redis
REDIS_HOST=redis
REDIS_PORT=6379
```

### 3. Build and Start Services
Run the following command to build and start the services:
```bash
docker-compose up --build
```


## Services and Ports

| Service       | Container Name  | Port      |
|---------------|-----------------|-----------|
| Laravel API   | `api`           | N/A       |
| Nginx         | `api-web`       | `8080`    |
| MySQL         | `api-db`        | `3306`    |
| Redis         | `api-redis`     | `6379`    |
| phpMyAdmin    | `api-phpmyadmin`| `8081`    |

---

## File Structure

```plaintext
.
WorkSpace Directory 
├── docker-setup              # Custom Docker setup files
│   ├── php                   # PHP-specific configurations
│   │   ├── Dockerfile        # PHP Dockerfile
│   │   └── local.ini         # Custom PHP configuration
│   ├── mysql                 # MySQL setup
│   │   ├── init.sql          # SQL script for database initialization
│   │   └── my.cnf            # Custom MySQL configurations
│   └── nginx                 # Nginx setup
│   │   └── api.conf          # Nginx virtual host configuration
│   ├── docker-compose.yml        # Defines services and configurations
├── emr-php                   # any Laravel application code (mounted as a volume)
└── README.md                 # Documentation (this file)
```

---

## Key Features
- **Environment Variables:** Configure application settings without modifying code.
- **Health Checks:** Ensures services are running correctly using Docker's `HEALTHCHECK`.
- **Volumes:** Persist data for MySQL and mount application code for live development.
- **Service Isolation:** Separate containers for each service (API, database, cache, web server).

---

## Common Commands

### Stop and Remove Containers
```bash
docker-compose down
```

### View Container Logs
```bash
docker-compose logs -f
```

### Enter a Running Container
```bash
docker exec -it <container_name> bash
```

### Clear Laravel Cache
```bash
docker exec -it api php artisan cache:clear
```

---

## Best Practices
1. **Use Secrets for Sensitive Data:** Store credentials securely using Docker secrets.
2. **Database Backups:** Regularly back up your MySQL data from the `db-data` volume.
3. **Resource Optimization:** Tune PHP-FPM, Nginx, and MySQL configurations for better performance.
4. **Health Checks:** Ensure services are healthy using Docker's `HEALTHCHECK` directives.
5. **Logs and Monitoring:** Use tools like Datadog or ELK stack to monitor container logs and performance.

---

## Troubleshooting

### Database Connection Issues
- Ensure the `.env` file matches the MySQL container credentials.
- Check the MySQL container logs for errors:
  ```bash
  docker logs api-db
  ```

### Permission Issues
- Ensure proper permissions for the mounted Laravel code (`emr-php`).
- Set ownership to `www-data` for Laravel files:
  ```bash
  docker exec -it api chown -R www-data:www-data /var/www/html
  ```

---

## Contributing
Feel free to submit pull requests for improvements or report issues on the GitHub repository.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

