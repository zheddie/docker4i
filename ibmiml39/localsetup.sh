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
	#for gcc10, we may not need it.
	if [ -f "/QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h" ]; then
		mv  /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h /QOpenSys/pkgs/lib/gcc/powerpc-ibm-aix6.1.0.0/10/include-fixed/sys/types.h.nouse
	fi
fi
echo "*******************************************************************************"
if [[ "$V$R" == "73" ]]; then
	echo "***NOTE:PTF SI80883 for 5770SS1 is required on IBM i7.3 to avoid some build failures for some project ***"
fi
if [[ "$V$R" == "74" ]]; then
	echo "***NOTE:PTF SI80885 for 5770SS1 is required on IBM i7.4 to avoid some build failures for some project ***"
fi
if [[ "$V$R" == "75" ]]; then
	echo "***NOTE:PTF SI80884 for 5770SS1 is required on IBM i7.5 to avoid some build failures for some project ***"
fi
echo "*******************************************************************************"


yum install -y pkg-config openblas-devel 
yum install -y libzmq5 libzmq-devel #for pyzmq
yum install -y freetype-devel libjpeg-turbo-devel zlib-devel #for pillow
yum install -y python39-psutil libxml2-devel libxslt-devel libffi-devel #for Jupyter
yum install -y qhull-devel #for matplotlib

#Prepare
python3.9 -m pip install pybind11 cython
python3.9 -m pip install --upgrade six
python3.9 -m pip install threadpoolctl joblib
python3.9 -m pip install pyzmq
python3.9 -m pip install ninja #Separate install it , as it's required by lots of projects.

echo "*******************************************************************************"
echo "***NOTE:Following packages would take long time.                              *"
echo "***NOTE:If failed or too long time without any reponse.Don't worry.           *"
echo "*        Trying following commands directly on i                              *"
echo "*python3.9 -m pip install numpy                                               *"
echo "*python3.9 -m pip install scipy                                               *"
echo "*python3.9 -m pip install scikit-learn                                        *"
echo "*python3.9 -m pip install Pillow                                              *"
echo "*python3.9 -m pip install jupyter jupyterlab                                  *"
echo "*python3.9 -m pip install matplotlib                                          *"
echo "*python3.9 -m pip install seaborn                                             *"
echo "*Starting them one by one ... ...                                             *"
echo "*******************************************************************************"
#numpy
echo "python3.9 -m pip install numpy"
python3.9 -m pip install numpy   #could installed, but need the PR to make the distutils works for scipy.

#scipy
echo "python3.9 -m pip install scipy"
python3.9 -m pip install scipy

# #scikit-learn
echo "python3.9 -m pip install scikit-learn"
python3.9 -m pip install scikit-learn==1.1.0  #Currently, need 

# #Pillow
echo "python3.9 -m pip install Pillow"
python3.9 -m pip install Pillow

# #Jupyter
echo "python3.9 -m pip install jupyter jupyterlab"
python3.9 -m pip install jupyter jupyterlab

#Matplotlib
echo "python3.9 -m pip install matplotlib"
python3.9 -m pip install matplotlib

# This will auto install pandas ,which require a long time to build. 
# In case you need pandas, try to install it by yourself.
echo "python3.9 -m pip install seaborn"
python3.9 -m pip install seaborn
