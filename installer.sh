#!/bin/sh

# install pip
yum install python-setuptools
easy_install pip

# install supervsior via pip
/usr/local/bin/pip install supervisor

# add files required for supervisor
/usr/local/bin/echo_supervisord_conf > supervisord.conf
cp supervisord.conf /etc/supervisord.conf
mkdir /etc/supervisord.d/

# make inclusion for all conf files in the supervisord directory
cat << as >> /etc/supervisord.conf
[include]
files = /etc/supervisord.d/*.conf
as

# create supervisord run
touch /etc/rc.d/init.d/supervisord
chmod +x /etc/rc.d/init.d/supervisord

# add configurations related to my_app
cat << as >> /etc/supervisord.d/my_app.conf
[program:my_app]
directory=/home/capdeploy/current/my_app
command=/usr/bin/run my_app
user=root
autostart=true
autorestart=true
stderr_logfile=/var/log/my_app.err.log
stdout_logfile=/var/log/my_app.out.log
as

# create supervisord run executable that was added previously
cat << as >> /etc/rc.d/init.d/supervisord
#!/bin/sh
#
# /etc/rc.d/init.d/supervisord
#
# Supervisor is a client/server system that
# allows its users to monitor and control a
# number of processes on UNIX-like operating
# systems.
#
# chkconfig: - 64 36
# description: Supervisor Server
# processname: supervisord

# Source init functions
. /etc/rc.d/init.d/functions

prog="supervisord"

prefix="/usr/local"
exec_prefix="${prefix}"
prog_bin="${exec_prefix}/bin/supervisord"
PIDFILE="/var/run/$prog.pid"

start()
{
       echo -n $"Starting $prog: "
       daemon $prog_bin --pidfile $PIDFILE
       [ -f $PIDFILE ] && success $"$prog startup" || failure $"$prog startup"
       echo
}

stop()
{
       echo -n $"Shutting down $prog: "
       [ -f $PIDFILE ] && killproc $prog || success $"$prog shutdown"
       echo
}

case "$1" in

 start)
   start
 ;;

 stop)
   stop
 ;;

 status)
       status $prog
 ;;

 restart)
   stop
   start
 ;;

 *)
   echo "Usage: $0 {start|stop|restart|status}"
 ;;

esac
as
