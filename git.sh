#!/usr/bin/env sh
# Alexis Megas.

if [ -z ${GIT_A} ];
then
    echo "Please export the account (GIT_A)."
    exit 1
fi

if [ -z ${GIT_T} ];
then
    echo "Please export the token (GIT_T)."
    exit 1
fi

while
    git pull
    git add .
    git commit -m "New pages."
    git push \
	https://${GIT_A}:${GIT_T}@github.com/textbrowser/spot-on-shared-pages
    sleep 300
do true; done

exit 0
