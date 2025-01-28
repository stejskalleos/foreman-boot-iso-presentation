%pre --interpreter=/bin/bash --erroronfail
#!/bin/bash

exec < /dev/tty3 > /dev/tty3
chvt 3
(

interval=1
count=0
max_hit=5
URL="https://foreman.local.lan/unattended/provision"

interface=$(ip route | awk '/default/ {print $5}')
mac=$(cat /sys/class/net/$interface/address)

rhn_header="X-RHN-Provisioning-MAC-0: $interface $mac"

echo "Adding CA file to the trusted"
cp /run/install/repo/foreman/foreman_ca.pem /etc/pki/ca-trust/source/anchors/
update-ca-trust extract

curl -H "$rhn_header" "$URL"

while [ $count -lt $max_hit ]
do
    echo "Running for $((count*interval)) seconds."

    response=$(curl -s -o /dev/null -H "$rhn_header" -w "%{http_code}" "$URL")

    if [ "$response" -eq 200 ]; then
        echo "Success: Received 200 OK from $URL"
        curl -s -o /root/host.ks -H "$rhn_header" "$URL"
        break
    else
        echo "Attempt $((count+1)): $response $URL. Retrying in $interval s"
    fi

    count=$((count+1))
    sleep $interval
done

if [ $count -eq $max_hit ]; then
    echo "Error: Maximum attempts reached. Exiting with error."
    exit 1
fi

chvt 1
) 2>&1 | tee /tmp/anaconda.log

%end

%include /root/host.ks
