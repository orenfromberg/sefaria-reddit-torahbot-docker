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

# Access Mongo Database
* The Mongo database is installed and populated with data when you run `/.build`
* The database is accessible at `localhost:27018`. You can connect to it using the Mongo shell or a Mongo GUI (like Studio 3T)

# Tips
In `web/local_settings.py`, change `DISABLE_AUTOCOMPLETER` to `True` for much faster startup time, at the cost of the fact that the frontend will not have the autocompleter. If you're not using the frontend, this shouldn't affect your usage.

