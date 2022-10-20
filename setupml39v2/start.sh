#! /bin/bash
echo "scp /opt/ibmi/localsetup.sh ${ICONNECT}:/tmp/"
scp /opt/ibmi/localsetup.sh ${ICONNECT}:/tmp/
echo "ssh ${ICONNECT} /tmp/localsetup.sh"
ssh ${ICONNECT} "/tmp/localsetup.sh"
