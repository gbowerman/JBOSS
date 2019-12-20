#!/bin/bash
# JBOSS EAP clustered setup script
export STORAGE_ACCOUNT_NAME=$1
export STORAGE_ACCESS_KEY=$2
#export PIP_ADDR=$3
export EAP_HOME=/opt/rh/eap7/root/usr/share/wildfly

cp $EAP_HOME/docs/examples/configs/standalone-azure-ha.xml $EAP_HOME/standalone/configuration/standalone-ha.xml

firewall-offline-cmd --add-port=8080/tcp
firewall-offline-cmd --add-port=8180/tcp
firewall-offline-cmd --add-port=9990/tcp
firewall-offline-cmd --add-port=10090/tcp

# get IP address
wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
chmod +x ./jq
cp jq /usr/bin
export IP_ADDR=`curl -H Metadata:true "http://169.254.169.254/metadata/instance/network?api-version=2017-03-01" | jq .interface[0].ipv4.ipaddress[0].ipaddress | sed -e 's/^"//' -e 's/"$//'`
# For now startup manually
# To do - edit the service and restart
$EAP_HOME/bin/standalone.sh -b $IP_ADDR -bprivate $IP_ADDR -bmanagement $IP_ADDR --server-config=standalone-ha.xml -Djboss.jgroups.azure_ping.storage_account_name=$STORAGE_ACCOUNT_NAME -Djboss.jgroups.azure_ping.storage_access_key=$STORAGE_ACCESS_KEY -Djboss.jgroups.azure_ping.container=jgroupcontainer > /var/log/eap7.log 2>&1 &