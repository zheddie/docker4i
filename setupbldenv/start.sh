#! /bin/bash
echo "scp /opt/ibmi/setupbldenv.sh ${ICONNECT}:/tmp/"
scp /opt/ibmi/setupbldenv.sh ${ICONNECT}:/tmp/
echo "ssh ${ICONNECT} /tmp/setupbldenv.sh"
ssh ${ICONNECT} "/tmp/setupbldenv.sh"
