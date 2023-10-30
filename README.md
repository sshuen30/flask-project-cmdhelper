## flask-project-cmdhelper
## Setup
- git clone this repository
``` bash
git clone https://github.com/sshuen30/flask-project-cmdhelper.git
```
``` bash
cd flask-project-cmdhelper
```
- Copy sample database to persistent volume in host: /cmdhelper
``` bash
cp sample_db/uploads/* /cmdhelper/uploads/
```
- Download cmdtable.sql in sample_db folder to your desktop
- Browse to http://ipaddress:8080 to access PHPmyadmin. User/Pwd: root/root
- Import cmdtable.sql to cmdtable

