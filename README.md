## flask-project-cmdhelper
## Setup
- git clone this repository
``` bash
git clone https://github.com/sshuen30/flask-project-cmdhelper.git
```
- Run docker-compose
``` bash
docker compose up -d --build
```
- Docker compose will start 3 container: flask app, mariadb, nginx, phpmyadmin
``` bash
cd flask-project-cmdhelper
```
- Copy sample database to host location: /cmdhelper
- First, copy sample database images to /cmdhelper/uploads
``` bash
cp sample_db/uploads/* /cmdhelper/uploads/
```
- Second, import sample database table to cmdtable database
- Download cmdtable.sql in sample_db folder to your desktop
- Browse to http://ipaddress:8080 to access PHPmyadmin. User/Pwd: root/root
- Import cmdtable.sql to cmdtable
## Access the webpage @ http://ipaddress:8081
