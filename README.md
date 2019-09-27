# qmpy_docker [ ![Build Status](https://travis-ci.org/wolverton-research-group/qmpy_docker.svg?branch=master) ](https://travis-ci.org/wolverton-research-group/qmpy_docker)

A docker image for qmpy (Internal Usage Only).

The container will connect to the read-only view of QMDB.

Link to [Docker Hub](https://hub.docker.com/r/oqmduser/qmpy_live).

## Get qmpy Docker image 
- Pull pre-built qmpy image (_Recommended_)
  - `docker pull oqmduser/qmpy_live`
- Create qmpy image by yourself
  - `docker build -t oqmduser/qmpy_live .`
  
## Use Docker to launch qmpy
  - qmpy environment
    - `docker run -it --rm --env-file <env_file> oqmduser/qmpy_live`
  - qmpy environment with file synchronization
    - `docker run -it --rm --env-file <env_file> -v <some_local_path>:/workspace oqmduser/qmpy_live`
  - Overwrite entrypoint 
    - `docker run -it --rm --env-file <env_file> --entrypoint "/bin/bash" oqmduser/qmpy_live`

## Format of Docker environment file
```
# Database Info
qmdbhost=<your_qmdb_host>
qmdbname=<your_qmdb_name>
qmdbpassword=<your_qmdb_password>
qmdbport=<your_qmdb_port>
qmdbuser=<your_qmdb_user>
```
