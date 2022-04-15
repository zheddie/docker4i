#! /bin/bash
echo "scp /opt/ibmi/setupmlenv.sh ${ICONNECT}:/tmp/"
scp /opt/ibmi/setupmlenv.sh ${ICONNECT}:/tmp/
echo "ssh ${ICONNECT} /tmp/setupmlenv.sh"
ssh ${ICONNECT} "/tmp/setupmlenv.sh"
