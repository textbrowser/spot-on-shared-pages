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

cd ~/spot-on-shared-pages.d 2>/dev/null

if [ ! $? -eq 0 ]
then
    echo "Cannot set spot-on-shared-pages.d as the current directory."
    exit 1
fi

while
    git pull
    git add .
    git commit -m "New pages."
    git push \
	https://${GIT_A}:${GIT_T}@github.com/textbrowser/spot-on-shared-pages
    echo "Removing empty files."
    find . ! -path '*.git*' -empty -type f -exec rm -f {} \; 2>/dev/null
    echo "Preparing index.html."
    ./build_index.sh
    echo "Pausing for one hour."
    sleep 3600
do true; done

exit 0
