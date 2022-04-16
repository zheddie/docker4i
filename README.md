# docker4i
Docker images for i open source manangement.

Currently, we have following three dockers 
* setuprpmenv 
	* This docker could help you to setup RPM env on target IBM i system.
* setupbldenv 
	* This docker help you to setup build ensential packages on target IBM i system.
* setupmlenv  
	* This docker help you to setup Machine Learning frameworks on target IBm i system.

## How to build the docker images
```
docker build -t <your_repo>/<your_image_name> .
```

## How to run these dockers
```
doccker run -it --rm -v <your_home_dir>/.ssh/id_rsa:/root/.ssh/id_isa -e ICONNECT=<your_account>@<target_ibmi_system> <your_repo>/<your_image_name>
```
