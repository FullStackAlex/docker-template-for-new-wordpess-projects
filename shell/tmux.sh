tmux rename-window "DOCKER"
tmux split-window -v # for any reason the first split has no effect as it seems, when executed from this script
tmux split-window -v
tmux swap-pane -U
tmux select-pane -T "docker-compose up"\; send-keys "docker-compose up --build" Enter # not using shell-script option because it destroys the pane when the container gets stopped
tmux resize-pane -U 10
tmux split-window -h \; select-pane -T "LOKALHORST"\;
tmux new-window -n "PHP / MySQL / Nginx"
tmux split-window -v
tmux swap-pane -U
tmux select-pane -T "PHP"\; send-keys "dockerbash wordpress_php"
tmux split-window -h \; select-pane -T "MYSQL"\; send-keys "dockerbash wordpress_mysql"
tmux select-pane -L
tmux select-pane -D \; select-pane -T "NGINX"\; send-keys "dockerbash wordpress_nginx"
tmux new-window -n "WEBPACK/NPM"
tmux split-window -v
tmux swap-pane -U
tmux select-pane -T "app frontend"\; send-keys "dockerbash wordpress_node"
tmux split-window -h \; select-pane -T "basic frontend"\; send-keys "dockerbash wordpress_node"
tmux select-pane -L
tmux select-pane -D \; select-pane -T "blog frontend"\; send-keys "dockerbash wordpress_node"
tmux split-window -h \; select-pane -T "comments frontend"\; send-keys "dockerbash wordpress_node"
#tmux split-window -h \; select-pane -T "startfrontend comments"\; send-keys "dockerbash wordpress_node"
#tmux split-window -h \; select-pane -T "startfrontend blog"\; send-keys "dockerbash wordpress_node"
#tmux select-pane -L \; select-pane -U # go left twice
tmux new-window -n GIT -d #-d creates the window without becoming it the current window
tmux new-window -n DRAWIO -d #-d creates the window without becoming it the current window
tmux new-window -n REMOTE -d #-d creates the window without becoming it the current window
tmux select-window -t "DOCKER"