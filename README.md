# qmpy_docker [ ![Build Status](https://travis-ci.org/wolverton-research-group/qmpy_docker.svg?branch=master) ](https://travis-ci.org/wolverton-research-group/qmpy_docker)

A docker image for the latest `qmpy`. This container is used to connected to an active QMDB (version > v1.3.0).

Link to [Docker Hub](https://hub.docker.com/r/oqmduser/qmpy_live).

## Get qmpy Docker image 
- Pull pre-built qmpy image (_Recommended_)
  - `docker pull oqmduser/qmpy_live`
- Create qmpy image by yourself
  - `docker build -t oqmduser/qmpy_live .`
  
## Set up the database
Download the database from [here](http://oqmd.org/static/downloads/qmdb.sql.gz). Unzip it and load it into a database MySQL. On a typical linux system, this process will look like:
```bash
$ wget http://oqmd.org/static/downloads/qmdb.sql.gz
$ gunzip qmdb.sql.gz
$ mysql < qmdb.sql
```

For more information about database installation, check this [tutorial](http://oqmd.org/static/docs/getting_started.html#setting-up-the-database).

## Prepare a Docker environment file
Use this file to build connection with the database. Follow the template below and save the into `env.list`. (Replace variables inside `<>` according to your MySQL installation.)
```
# Database Info
qmdbhost=<your_qmdb_host>
qmdbname=<your_qmdb_name>
qmdbpassword=<your_qmdb_password>
qmdbport=<your_qmdb_port>
qmdbuser=<your_qmdb_user>
```
  
## Use Docker to launch qmpy
  - qmpy environment
    - `docker run -it --rm --env-file env.list oqmduser/qmpy_live`
  - qmpy environment with file synchronization
    - `docker run -it --rm --env-file env.list -v <some_local_path>:/workspace oqmduser/qmpy_live`
  - Overwrite entrypoint 
    - `docker run -it --rm --env-file env.list --entrypoint "/bin/bash" oqmduser/qmpy_live`


