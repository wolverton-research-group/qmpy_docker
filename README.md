# qmpy_docker

A docker image for qmpy (Internal Usage Only).

The container will connect to the read-only view of QMDB.

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
