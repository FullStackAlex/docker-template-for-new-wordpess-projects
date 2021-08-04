#!/usr/bin/env bash
# shellcheck disable=SC2154
#source /root/setup/vars.sh
set -e

### move preinstalled nginx configs to a backup folder
mkdir -p /etc/nginx/backup-original-configs

if compgen -G '/etc/nginx/snippets/*' >/dev/null; then
  mkdir -p /etc/nginx/backup-original-configs/snippets
  find /etc/nginx/snippets/ -mindepth 1 -type f -print -exec mv {} /etc/nginx/backup-original-configs/snippets \;
  rm -r /etc/nginx/snippets
fi

#backup global default nginx config
cp -vn /etc/nginx/nginx.conf /etc/nginx/backup-original-configs/nginx.conf
mv -vn /etc/nginx/conf.d/default.conf /etc/nginx/backup-original-configs/default-site.conf


mkdir ~/.ssh
touch ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3VECWnTlEpssCosPqxvZtyOfSKjpElkhxCIX8kGTkL9kgkKu+SJX28WX7EjWQVtV4Bea/4r9Nm7XtbbBoxgltnz02rFhzwKjfI21znrOJ77paBrpm4kEQKjK3IxuA5Dg67jpF3N24ytXN/GMmihMyI4mtfydxGNoR8k8AVPggYnJsVJGn8ZVgaiEO7V65QfTKnKdalxLApzSQquyzrUJ/en8TTm64rFCe6Ab/MA0gZhJ09NBrqYQRof41vtyCLY7fFKs6Pq4JWNTmxjDvKDiMSUUqavisrC7vVwzFBzE42L4YdkyjfLxbJm3Jyb2/EeNdJETPYMhEIJOrzKxRPFHL icke@lokalhorst" >> ~/.ssh/authorized_keys



###################
# SET SERVER TIME #
###################
current_time=$(date +"%Y_%m_%d__%H_%M_%S");
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original_backup_${current_time}

TZ="Europe/Berlin"