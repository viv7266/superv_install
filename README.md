# superv_install
login to your server. Switch to user `root`
Edit my_app conf in the installer.sh file.
`sh installer.sh`
`service supervisord start` 
Some helper commands once you are done installing supevisor: `/usr/local/bin/supervisorctl update` to add new conf
`/usr/local/bin/supervisorctl status all` to get status of all supervsior programs
`/usr/local/bin/supervisorctl stop my_app` to stop a particular app program
`/usr/local/bin/supervisorctl stop all` to stop a all programs
`/usr/local/bin/supervisorctl start my_app` to start a particular app program
`/usr/local/bin/supervisorctl restart my_app` to restart a particular app program
