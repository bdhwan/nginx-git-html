#!/bin/bash
echo "ok"




echo "GIT_URL: "$GIT_URL
echo "DST_FOLDER: "$DST_FOLDER

git clone --depth 1 --single-branch --branch $BRANCH "$GIT_URL"

rm -rf /var/www/html

if [ -z "$DST_FOLDER" ]
then
    echo "not defined DST_FOLDER"
    mv "$(basename "$GIT_URL" .git)" /var/www/html
else 
    echo "defined =" $DST_FOLDER
    cd "$(basename "$GIT_URL" .git)"
	mv $DST_FOLDER /var/www/html
fi

nginx -g 'daemon off;'
