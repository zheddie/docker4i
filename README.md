# docker4i
Docker images for i open source manangement.

Currently, we have following 4 dockers in this repo.
* ibmirpm
	* This docker could help you to setup RPM env on target IBM i system.
* ibmibld39
	* This docker help you to setup build essential packages, especially for python 3.9 on target IBM i system.

* ibmiml39 
	* This docker helps you to setup following Machine Learning frameworks(based on python3.9) on target IBM i system.
		+ pybind11 cython six threadpoolctl joblib pyzmq ninja seaborn
		+ Pillow
		+ numpy
		+ scipy
		+ scikit-learn
		+ jupyter jupyterlab
		+ matplotlib
		+ pandas

	* NOTE: The packages after numpy would take long time depends on your systems. If failed or too long time without any reponse. Don't worry, try to install them directly on IBM i using `python3.9 -m pip install <packageName> `.

* mlserver
	* This docker help you to setup Machine Learning Server(mlserver==1.1.0) on IBM i system.

## How to build the docker images
* Following command could help you build out the docker images.
```
docker build -t <your_repo>/<your_image_name> .
```
* We also have pre-build images available for your use dicrectly from docker.io. You can just download and use them by docker pull as below:
	* docker.io/zheddie/ibmirpm
	* docker.io/zheddie/ibmibld39
	* docker.io/zheddie/ibmiml39
	* docker.io/zheddie/ibmimlserver

## Prereqs to run these dockers on your IBM i.
* Following LPP are required tobe installed:
	* 5770SS1 Option 33 Portable App Solutions Environment(PASE)
	* 5770SS1 Option 13 System Openness Includes
	* 5770SC1 Option 1  OpenSSH, OpenSSL, zlib

* Following PTFs are required
	* i 7.3: SI80883
	* i 7.4: SI80885
	* i 7.5: SI80884

* To make the OpenSSH work, we need to start the *SSHD server before we access it. Following command could be used to start the *SSHD in 5250 session.
	* `STRTCPSVR SERVER(*SSHD)`
* Non-password access is recommanded, or else, you would be prompt for any remote acess.
	* `ssh-copy-id <your_account>@<target_ibmi_system>`
* To make you easily access all utilities in RPM, PATH env could be set as below when ever you access IBM i through OpenSSH.
	* `export PATH=/QOpenSys/pkgs/bin:~/gcc10bin:$PATH`
	* `export OBJECT_MODE=64`

## How to run these dockers
```
doccker run -it --rm -v <your_home_dir>/.ssh/id_rsa:/root/.ssh/id_isa -e ICONNECT=<your_account>@<target_ibmi_system> <your_repo>/<your_image_name>
```
