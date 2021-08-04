mkdir ~/.ssh
touch ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3VECWnTlEpssCosPqxvZtyOfSKjpElkhxCIX8kGTkL9kgkKu+SJX28WX7EjWQVtV4Bea/4r9Nm7XtbbBoxgltnz02rFhzwKjfI21znrOJ77paBrpm4kEQKjK3IxuA5Dg67jpF3N24ytXN/GMmihMyI4mtfydxGNoR8k8AVPggYnJsVJGn8ZVgaiEO7V65QfTKnKdalxLApzSQquyzrUJ/en8TTm64rFCe6Ab/MA0gZhJ09NBrqYQRof41vtyCLY7fFKs6Pq4JWNTmxjDvKDiMSUUqavisrC7vVwzFBzE42L4YdkyjfLxbJm3Jyb2/EeNdJETPYMhEIJOrzKxRPFHL icke@lokalhorst" >> ~/.ssh/authorized_keys


#allow root login just by typing mysql from command line
/usr/bin/expect << EOF
    spawn mysql_config_editor set --login-path=client --host=localhost --user=root --password
    expect -nocase "Enter password:" {send "root\r"; interact}
EOF


###################
# SET SERVER TIME #
###################
current_time=$(date +"%Y_%m_%d__%H_%M_%S");
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original_backup_${current_time}

TZ="Europe/Berlin"