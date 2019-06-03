#!/bin/bash

function shutdown()
{
        date
        echo "Shutting down Confluence"
        $CATALINA_HOME/bin/catalina.sh stop
}

date
echo "Starting Confluence"
export CATALINA_PID=/tmp/$$

# Uncomment to increase Tomcat's maximum heap allocation
# export JAVA_OPTS=-Xmx512M $JAVA_OPTS

. $CATALINA_HOME/bin/catalina.sh start

# Allow any signal which would kill a process to stop Tomcat
trap shutdown HUP INT QUIT ABRT KILL ALRM TERM TSTP

echo "Waiting for `cat $CATALINA_PID`"
wait `cat $CATALINA_PID`
