#! /bin/bash
echo "scp /opt/ibmi/localsetup.sh /opt/ibmi/bind /opt/ibmi/python39-grpcio-compileroptions.patch ${ICONNECT}:/tmp/"
scp /opt/ibmi/localsetup.sh /opt/ibmi/bind /opt/ibmi/python39-grpcio-compileroptions.patch ${ICONNECT}:/tmp/
echo "ssh ${ICONNECT} /tmp/localsetup.sh"
ssh ${ICONNECT} "/tmp/localsetup.sh"
