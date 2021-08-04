#!/usr/bin/env bash

#RUN BEFORE PUSHING UPDATES TO GIT, if you need the compiled bundles in the repo (so you don't need to compile them first when checking out a commit/branch)
rsync -aEv --delete  "../node/public/main/" "../php/app/wp-content/themes/wordpress/bundles"