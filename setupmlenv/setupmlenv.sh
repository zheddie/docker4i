#! /QOpenSys/pkgs/bin/bash
export PATH=/QOpenSys/pkgs/bin/:$PATH
yum update -y
yum install -y python3 python3-devel python3-pip
pip3 install --upgrade pip
yum install -y python3-ibm_db
yum install -y gcc gcc-cplusplus gcc-aix gcc-cpp-aix gcc-cplusplus-aix libstdcplusplus-devel 
yum install -y openblas openblas-devel
release=`uname -vr`
if [ "*$release*" == "*5 7*" ]; then
mv  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/6.3.0/include-fixed-7.1/sys/types.h  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/6.3.0/include-fixed-7.1/sys/types.h.nouse
fi
# numpy can be built successfully from pip3, but scipy can not. 
# and currently, scipy require python3-numpy.
yum install -y python3-scipy #(1.1.0)   # python3-numpy (1.15.4)
#pip3 install --upgrade numpy==1.19.5
yum install -y python3-scikit-learn #(0.19.1)
yum install -y tcl tk pkg-config python3-tkinter python3-six #six(1.10.0)
yum install -y freetype-devel libfreetype6
yum install -y libpng-devel libpng16
yum install -y libzmq5 libzmq-devel zlib-devel 
yum install -y libffi-devel       #Required by jupyter.
yum install -y libjpeg-turbo-devel #Required by Pillow
pip3 install --upgrade six==1.16.0
pip3 install Pillow==8.4.0
pip3 install jupyter==1.0.0              #Required six>=1.11.0
pip3 install jupyterlab==3.2.9
pip3 install cython==0.29.28
pip3 install matplotlib==3.3.4
# pip3 install pandas==1.1.5
# pip3 install seaborn==0.11.2
