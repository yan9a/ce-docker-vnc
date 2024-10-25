#!/bin/sh

echo "Desired Timezone is $TZ ..."
# if TZ is not "Pacific/Auckland", e.g. "America/New_York"
if [ "$TZ" != "Pacific/Auckland" ]; then
    echo "Changing timezone."
    rm -f /etc/localtime
    ln -sf "/usr/share/zoneinfo/$TZ" /etc/localtime
    echo "$TZ" > /etc/timezone
    echo "Time zone set to: $(cat /etc/timezone)"
else
    echo "TZ is already set to Pacific/Auckland."
fi

# export USER=${root:-$(whoami)}
if [ "${PASSWD}" != "password" ]; then
    echo "Updating password."
    rm -f /root/.vnc/passwd
    x11vnc -storepasswd "${PASSWD}" /root/.vnc/passwd
    chmod 600 /root/.vnc/passwd
    echo "root:${PASSWD}" | chpasswd
else
    echo "Using default password."
fi

ssh-keygen -A
eval "$(dbus-launch --sh-syntax)"
export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID
/usr/bin/supervisord
