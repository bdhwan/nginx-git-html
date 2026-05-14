#!/bin/bash
echo "ok"


echo "GIT_URL: "$GIT_URL
echo "DST_FOLDER: "$DST_FOLDER

git clone --depth 1 --single-branch --branch $BRANCH "$GIT_URL"

ls
rm -rf /var/www/html

ls
pwd
cd "$(basename "$GIT_URL" .git)"    
ls
pwd


npm install
npm run build

if [ -z "$DST_FOLDER" ]
then
    echo "not defined DST_FOLDER"
    mv "$(basename "$GIT_URL" .git)" /var/www/html
else 
    echo "defined =" $DST_FOLDER
	mv $DST_FOLDER /var/www/html
fi

nginx -g 'daemon off;'
