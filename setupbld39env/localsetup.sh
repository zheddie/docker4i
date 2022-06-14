#! /QOpenSys/pkgs/bin/bash
export PATH=/QOpenSys/pkgs/bin/:$PATH
yum update -y
yum install -y python39 python39-devel python39-pip
python3.9 -m pip install --upgrade pip
yum install -y gcc10 gcc10-cplusplus gcc10-cpp gcc10-cplusplus gcc10-gfortran libstdcplusplus6-10-devel 
release=`uname -vr`
if [ "*$release*" == "*5 7*" ]; then
	echo "Fixing for gcc10"
	#for gcc10, we may not needed it anymore.
	#mv  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/6.3.0/include-fixed-7.1/sys/types.h  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/6.3.0/include-fixed-7.1/sys/types.h.nouse
fi
yum install -y vim git wget curl gzip
yum install -y patch-gnu m4-gnu grep-gnu sed-gnu tar-gnu
yum install -y make-gnu cmake  automake autoconfig
yum install -y maven
