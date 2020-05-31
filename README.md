# nginx-git-html
```
version: "3.3"
services:
  beta-user:
    hostname: 'beta-user'
    image: bdhwan/nginx-git-html:3.7
    environment:
    - GIT_URL=some_git_url_with_id_pw_if_need
    - DST_FOLDER=root_folder_from_git_url
    ports:
    - "8010:80"
    deploy:
      placement:
        constraints:
        - node.labels.html_user == html_user 
        
```
