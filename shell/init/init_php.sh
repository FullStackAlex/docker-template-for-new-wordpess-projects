#!/usr/bin/env bash
# shellcheck disable=SC2034 #unused vars warning suppression
# shellcheck disable=SC2154 #unassigned vars warning suppression
# shellcheck disable=SC2164 #cd without "|| exit" suppression

#######
# SSH #
#######
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3VECWnTlEpssCosPqxvZtyOfSKjpElkhxCIX8kGTkL9kgkKu+SJX28WX7EjWQVtV4Bea/4r9Nm7XtbbBoxgltnz02rFhzwKjfI21znrOJ77paBrpm4kEQKjK3IxuA5Dg67jpF3N24ytXN/GMmihMyI4mtfydxGNoR8k8AVPggYnJsVJGn8ZVgaiEO7V65QfTKnKdalxLApzSQquyzrUJ/en8TTm64rFCe6Ab/MA0gZhJ09NBrqYQRof41vtyCLY7fFKs6Pq4JWNTmxjDvKDiMSUUqavisrC7vVwzFBzE42L4YdkyjfLxbJm3Jyb2/EeNdJETPYMhEIJOrzKxRPFHL icke@lokalhorst" >> ~/.ssh/authorized_keys


###################
# SET SERVER TIME #
###################
current_time=$(date +"%Y_%m_%d__%H_%M_%S");
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original_backup_${current_time}

TZ="Europe/Berlin"


git config --global user.email "icke@wordpress-template"
git config --global user.name "Icke"

#############
# WORDPRESS #
#############
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /root/.wp-cli/cache
find /var/www/html -type d -exec chmod 6775 {} +
find /var/www/html -type f -exec chmod 0664 {} +