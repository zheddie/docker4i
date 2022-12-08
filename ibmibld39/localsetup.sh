#! /QOpenSys/pkgs/bin/bash
export PATH=/QOpenSys/pkgs/bin/:$PATH
yum update -y
yum install -y python39 python39-devel python39-pip
python3.9 -m pip install --upgrade pip
yum install -y gcc10 gcc10-cplusplus gcc10-cpp gcc10-cplusplus gcc10-gfortran libstdcplusplus6-10-devel 
mkdir -p ~/gcc10bin
#since gcc10, we can not use gcc or g++ directly.
if [ -e ~/gcc10bin/gcc ]; then
	rm ~/gcc10bin/gcc
fi
ln -s /QOpenSys/pkgs/bin/gcc-10 ~/gcc10bin/gcc
if [ -e ~/gcc10bin/g++ ]; then
	rm ~/gcc10bin/g++
fi
ln -s /QOpenSys/pkgs/bin/g++-10 ~/gcc10bin/g++
if [ -e ~/gcc10bin/cc ]; then
	rm ~/gcc10bin/cc
fi
ln -s /QOpenSys/pkgs/bin/gcc-10 ~/gcc10bin/cc
if [ -e ~/gcc10bin/c++ ]; then
	rm ~/gcc10bin/c++
fi
ln -s /QOpenSys/pkgs/bin/g++-10 ~/gcc10bin/c++
if [ -e ~/gcc10bin/gfortran ]; then
	rm ~/gcc10bin/gfortran
fi
ln -s /QOpenSys/pkgs/bin/gfortran-10 ~/gcc10bin/gfortran
R=`uname -r`
V=`uname -v`
if [[ "$V$R" > "74" ]]; then
	echo "Fixing for gcc10"
	#for gcc10, we still need it.
	if [ -f "/QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h" ]; then
		mv  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h.nouse
	fi
fi
yum install -y pkg-config     #Used for python package install/build
yum install -y vim git wget curl gzip
yum install -y patch-gnu m4-gnu grep-gnu sed-gnu tar-gnu
yum install -y make-gnu cmake  automake autoconfig
yum install -y maven
#some pre-reqs for some packages
yum install -y c-ares-devel openssl-devel
