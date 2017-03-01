# superv_install
1. login to your server. Switch to user `root`
2. Edit my_app conf in the installer.sh file.
3. `sh installer.sh`
4. `service supervisord start`

### Some helper commands once you are done installing supevisor: 
1. `/usr/local/bin/supervisorctl update` to add new conf
2. `/usr/local/bin/supervisorctl status all` to get status of all supervsior programs
3. `/usr/local/bin/supervisorctl stop my_app` to stop a particular app program
4. `/usr/local/bin/supervisorctl stop all` to stop a all programs
5. `/usr/local/bin/supervisorctl start my_app` to start a particular app program
6. `/usr/local/bin/supervisorctl restart my_app` to restart a particular app program
