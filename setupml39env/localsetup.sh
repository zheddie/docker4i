#! /QOpenSys/pkgs/bin/bash
export PATH=/QOpenSys/pkgs/bin/:~/gcc10bin:$PATH
yum update -y
yum install -y python3.9python39-devel python39-pip
python3.9 -m pip install --upgrade pip
yum install -y python39-ibm_db
#yum install -y gcc gcc-cplusplus gcc-aix gcc-cpp-aix gcc-cplusplus-aix libstdcplusplus-devel 
yum install -y gcc10 gcc10-cplusplus gcc10-cpp gcc10-cplusplus gcc10-gfortran libstdcplusplus6-10-devel
mkdir -p ~/gcc10bin
#since gcc10, we can not use gcc or g++ directly.
if [ -e ~/gcc10bin/gcc ]; then
	rm ~/gcc10bin/gcc
fi
if [ -e ~/gcc10bin/g++ ]; then
	rm ~/gcc10bin/g++
fi
ln -s /QOpenSys/pkgs/bin/gcc-10 ~/gcc10bin/gcc
ln -s /QOpenSys/pkgs/bin/g++-10 ~/gcc10bin/g++
#yum install -y openblas openblas-devel    #This could cause error in sklearn.base on i7.3 and i7.4 
release=`uname -vr`
if [ "*$release*" == "*5 7*" ]; then
	#openblas/0.3.19-1 on i 7.3 ,7.4 and 7.5would cause some error.
	#yum install -y openblas openblas-devel
	#for gcc10, we may not need it.
	if [ -f "/QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h" ]; then
		mv  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h.nouse
	fi
fi
yum install -y libcblas3     # try to avoid the dependency on libopenblas0 by python39-scipy.
yum install -y python39-scipy #(1.1.0)   # python39-numpy (1.15.4)
yum install -y python39-scikit-learn #(0.19.1)
yum install -y tcl tk pkg-config python39-tkinter python39-six #six(1.10.0)
yum install -y freetype-devel libfreetype6
yum install -y libpng-devel libpng16
yum install -y libzmq5 libzmq-devel zlib-devel 
#yum install -y python39-dateutil python39-pytz   #required by pandas. Prefer to isntall here.
yum install -y python39-pytz   #required by pandas. Prefer to isntall here.
python3.9 -m pip install python-dateutil #required by pandas.
yum install -y python39-psutil python39-pandas
yum install -y libffi-devel       #Required by jupyter.
yum install -y libjpeg-turbo-devel #Required by Pillow
#yum install -y python39-pyzmq     # replaced by latest version of pyzmq
python3.9 -m pip install pyzmq
python3.9 -m pip install pybind11
python3.9 -m pip install --upgrade six==1.16.0
python3.9 -m pip install Pillow==8.4.0
python3.9 -m pip install jupyter==1.0.0              #Required six>=1.11.0
python3.9 -m pip install jupyterlab==3.2.9
python3.9 -m pip install cython==0.29.28
#python3.9 -m pip install matplotlib==3.3.4
#python3.9 -m pip install pandas==1.1.5
#python3.9 -m pip install seaborn==0.11.2
