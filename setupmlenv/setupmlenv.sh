#! /QOpenSys/pkgs/bin/bash
export PATH=/QOpenSys/pkgs/bin/:$PATH
yum update -y
yum install -y python3 python3-devel python3-pip
python3 -m pip install --upgrade pip
yum install -y python3-ibm_db
yum install -y gcc gcc-cplusplus gcc-aix gcc-cpp-aix gcc-cplusplus-aix libstdcplusplus-devel 
#yum install -y openblas openblas-devel    #This could cause error in sklearn.base on i7.3 and i7.4 
release=`uname -vr`
if [ "*$release*" == "*5 7*" ]; then
	#openblas/0.3.19-1 on i 7.4 would cause some error.
	yum install -y openblas openblas-devel
	mv  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/6.3.0/include-fixed-7.1/sys/types.h  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/6.3.0/include-fixed-7.1/sys/types.h.nouse
fi
yum install -y python3-scipy #(1.1.0)   # python3-numpy (1.15.4)
yum install -y python3-scikit-learn #(0.19.1)
yum install -y tcl tk pkg-config python3-tkinter python3-six #six(1.10.0)
yum install -y freetype-devel libfreetype6
yum install -y libpng-devel libpng16
yum install -y libzmq5 libzmq-devel zlib-devel 
yum install -y python3-dateutil python3-pytz   #required by pandas. Prefer to isntall here.
yum install -y libffi-devel       #Required by jupyter.
yum install -y libjpeg-turbo-devel #Required by Pillow
python3 -m pip install --upgrade six==1.16.0
python3 -m pip install Pillow==8.4.0
python3 -m pip install jupyter==1.0.0              #Required six>=1.11.0
python3 -m pip install jupyterlab==3.2.9
python3 -m pip install cython==0.29.28
python3 -m pip install matplotlib==3.3.4
