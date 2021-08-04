# Docker template for local full stack WordPress development with fully separated basic services (Mysql, PHP, Nginx amd Node)
## Init
### 1.  Edit env.
### 2.  Check docker-compose.yml if everything is correct.
### 2.1 Comment out the ./php/app:/var/www/html volume
### 3.  add server_name to your local machines /etc/hosts (MacOS / Linux)
### 4.  add virtualhost in your local apache2 config
### 5.  restart apache
### 6.  run rdocker-compose up --build
### 7.  login into mysql container and run manually "ALTER USER 'project_name'@'%' IDENTIFIED WITH mysql_native_password BY 'project_name';" as mysql root user
### 8.  login into php container and run /root/setup/install-wp.sh in php container manually
### 9.  check if everything is fine in browser
### 10. copy php/app to the host: docker cp project_name_php:/var/www/html/. ./php/app/
### 11. Uncomment the php/app:/var/www/html volume in docker-compose.yml 


## Errors 
### 1. If Mixed content errors (http in urls): a hard refresh should solve the issue
### 2. If COPY errors: check .dockerignore
