#!/usr/bin/bash

PROJECT_DIR="/root/projects/project-crab-gang"
cd $PROJECT_DIR || exit

inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ "$inside_git_repo" ]; then
	git fetch && git reset origin/main --hard
else
	echo "Current dir does not use git"
	exit
fi

docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d --build
