# Sefaria-Docker
These scripts create three containers tied together with docker-compose.  One is a vanilla Redis install, one is a mongo install built with the latest Sefaria data, and the third is a Python/Django/Node server running the latest Sefaria code.  

The `./build` script will fetch the latest data and built the containers.
The `./run` script will bring up the containers and provision the local Sefaria web client on `0.0.0.0:8000`.  


# Quick Start
* Install Docker.
  * On Mac, this works well - https://store.docker.com/editions/community/docker-ce-desktop-mac
* Clone this repo. 
* `./build`
* `./run`
* Browse to `http://0.0.0.0:8000`.

