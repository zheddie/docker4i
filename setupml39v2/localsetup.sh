#! /QOpenSys/pkgs/bin/bash
export PATH=/QOpenSys/pkgs/bin/:~/gcc10bin:$PATH
export OBJECT_MODE=64
yum update -y
yum install -y python3.9 python39-devel python39-pip
python3.9 -m pip install --upgrade pip
yum install -y python39-ibm_db
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
ln -s /QOpenSys/pkgs/bin/gcc-10 ~/gcc10bin/cc
ln -s /QOpenSys/pkgs/bin/g++-10 ~/gcc10bin/g++
ln -s /QOpenSys/pkgs/bin/g++-10 ~/gcc10bin/c++
ln -s /QOpenSys/pkgs/bin/gfortran-10 ~/gcc10bin/gfortran
release=`uname -vr`
if [ "*$release*" == "*5 7*" ]; then
	#openblas/0.3.19-1 on i 7.3 ,7.4 and 7.5would cause some error.
	#yum install -y openblas openblas-devel
	#for gcc10, we may not need it.
	if [ -f "/QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h" ]; then
		mv  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h.nouse
	fi
fi
yum install -y pkg-config openblas-devel libzmq5

yum install -y freetype-devel libjpeg-turbo-devel zlib-devel #for pillow
yum install -y python39-psutil libxml2-devel libxslt-devel libffi-devel #for Jupyter
#Prepare
python3.9 -m pip install pybind11 cython
python3.9 -m pip install --upgrade six
#numpy
python3.9 -m pip install numpy   #could installed, but need the PR to make the distutils works for scipy.
#scipy
python3.9 -m pip install ply gast beniget pythran
# python3.9 -m pip install ninja #This is required by pip3:ninja
# yum install ninja-build  #This is required by pip3:ninja, while pip3:ninja would change the bin/ninja to python scirpt.

# #
# python3.9 -m pip install scipy #It would also trying to install ninja as pip package. Also need a PR to make "func_data" changed.
# #scikit-learn
# #python3.9 -m pip install threadpoolctl joblib
# python3.9 -m pip install scikit-learn  #Currently, need 

# #Pandas
# #python3.9 -m pip install python-dateutil pytz  #prereq by pandas.
# python3.9 -m pip install pandas
# #Pillow
# python3.9 -m pip install Pillow



# #Jupyter
# python3.9 -m pip install pyzmq
# python3.9 -m pip install jupyter jupyterlab

# #matplotlib
# pip3 install matplotlib


#Matplotlib
#yum install qhull #for matplotlib.
#python3.9 -m pip install cppy kiwisolver    #Required by matplotlib 
#python3.9 -m pip install contourpy
#python3.9 -m pip install matplotlib      #Waiting on the available of qhull.
#python3.9 -m pip install seaborn

#NO USE as for now.
#yum install -y tcl tk python39-tkinter  #for matplotlib, may not need anymore?
#yum install -y libpng-devel libpng16
#yum install -y python39-dateutil python39-pytz  python39-six  #required by pandas. No need any more.

