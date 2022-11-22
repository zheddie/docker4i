#! /bin/bash
echo "scp /opt/ibmi/localsetup.sh /opt/ibmi/bootstrap.sh /opt/ibmi/bootstrap.tar.Z ${ICONNECT}:/tmp/"
scp /opt/ibmi/localsetup.sh /opt/ibmi/bootstrap.sh /opt/ibmi/bootstrap.tar.Z ${ICONNECT}:/tmp/
echo "ssh ${ICONNECT} /tmp/localsetup.sh"
ssh ${ICONNECT} "/tmp/localsetup.sh"
echo "scp ${ICONNECT}:/tmp/bootstrap.log /tmp"
scp ${ICONNECT}:/tmp/bootstrap.log /tmp
cat /tmp/bootstrap.log