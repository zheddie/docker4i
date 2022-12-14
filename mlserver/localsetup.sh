#! /QOpenSys/pkgs/bin/bash
export PATH=/QOpenSys/pkgs/bin/:~/gcc10bin:$PATH
export OBJECT_MODE=64

#Getting code.
#wget https://files.pythonhosted.org/packages/c4/8a/61f84aa2f061395a1aa9faaf325fa200da44191c9631082f33d46602efff/grpcio-1.51.1.tar.gz
cd /tmp
python3.9 -c "import grpc" 2> /dev/null
if [[ "$?" != "0" ]]; then
    #Tring to install new
    rm -rf grpcio-*
    echo "python3.9 -m pip download --no-deps -d . grpcio"
    python3.9 -m pip download --no-deps -d . grpcio
    ZIPFILE=`ls -ld grpcio-1.*|awk '{print $9}'`
    echo "tar zxf $ZIPFILE"
    tar zxf $ZIPFILE
    cd ${ZIPFILE%.tar.gz}
    export PATH=..:/QOpenSys/pkgs/bin/:~/gcc10bin:$PATH  #adding ../bind 

    #Patching code
    echo "patch -p1 < ../python39-grpcio-compileroptions.patch"
    patch -p1 < ../python39-grpcio-compileroptions.patch

    #install...
    echo "GRPC_PYTHON_BUILD_SYSTEM_CARES=1 GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1 python3.9 -m pip install ."
    GRPC_PYTHON_BUILD_SYSTEM_CARES=1 GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1 python3.9 -m pip install .
fi
echo "python3.9 -m pip install mlserver==1.1.0"
python3.9 -m pip install mlserver==1.1.0
python3.9 -m pip install mlserver-sklearn==1.1.0
# python3.9 -m pip install mlserver-xgboost==1.1.0