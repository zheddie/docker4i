#! /bin/bash
echo "scp /opt/ibmi/setuprpmenv.sh /opt/ibmi/bootstrap.sh /opt/ibmi/bootstrap.tar.Z ${ICONNECT}:/tmp/"
ssh ${ICONNECT} "ls /tmp/bootstrap.tar.Z"
if [ "$?" -ne "0" ]; then
    scp /opt/ibmi/setuprpmenv.sh /opt/ibmi/bootstrap.sh /opt/ibmi/bootstrap.tar.Z ${ICONNECT}:/tmp/
else
    scp /opt/ibmi/setuprpmenv.sh /opt/ibmi/bootstrap.sh ${ICONNECT}:/tmp/
fi
echo "ssh ${ICONNECT} /tmp/setuprpmenv.sh"
ssh ${ICONNECT} "/tmp/setuprpmenv.sh"
echo "scp ${ICONNECT}:/tmp/bootstrap.log /tmp"
scp ${ICONNECT}:/tmp/bootstrap.log /tmp
cat /tmp/bootstrap.log