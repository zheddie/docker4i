#! /QOpenSys/pkgs/bin/bash
export PATH=/QOpenSys/pkgs/bin/:$PATH
yum update -y
yum install -y python3 python3-devel python3-pip
python3 -m pip install --upgrade pip
yum install -y gcc gcc-cplusplus gcc-aix gcc-cpp-aix gcc-cplusplus-aix libstdcplusplus-devel 

release=`uname -vr`
if [ "*$release*" == "*5 7*" ]; then
mv  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/6.3.0/include-fixed-7.1/sys/types.h  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/6.3.0/include-fixed-7.1/sys/types.h.nouse
fi
yum install -y vim git wget curl gzip
yum install -y patch-gnu m4-gnu grep-gnu sed-gnu tar-gnu
yum install -y make-gnu cmake  automake autoconfig
