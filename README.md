# docker4i
Docker images for i open source manangement.

Currently, we have following three dockers 
* ibmirpm
	* This docker could help you to setup RPM env on target IBM i system.
* ibmibld39
	* This docker help you to setup build ensential packages, especially for python 3.9 on target IBM i system.
* ibmiml39 
	* This docker help you to setup Machine Learning frameworks(based on python3.9) on target IBm i system.

## How to build the docker images
```
docker build -t <your_repo>/<your_image_name> .
```
## Prereqs to run these dockers on your IBM i.
* Following LPP are required tobe installed:
	* 5770SS1 Option 33 Portable App Solutions Environment(PASE)
	* 5770SS1 Option 13 System Openness Includes
	* 5770SC1 Option 1  OpenSSH, OpenSSL, zlib
* To make the OpenSSH work, we need to start the *SSHD server before we access it. Following command could be used to start the *SSHD in 5250 session.
	* `STRTCPSVR SERVER(*SSHD)`
* Non-password access is recommanded, or else, you would be prompt for any remote acess.
	* `ssh-copy-id <your_account>@<target_ibmi_system>`
* To make you easily access all utilities in RPM, PATH env could be set as below when ever you accessed on IBM i through OpenSSH. 
	* `export PATH=/QOpenSys/pkgs/bin:~/gcc10bin:$PATH`

## How to run these dockers
```
doccker run -it --rm -v <your_home_dir>/.ssh/id_rsa:/root/.ssh/id_isa -e ICONNECT=<your_account>@<target_ibmi_system> <your_repo>/<your_image_name>
```
