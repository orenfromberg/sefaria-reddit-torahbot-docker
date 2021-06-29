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
* The database is accessible at `localhost:27017`. You can connect to it using the Mongo shell or a Mongo GUI (like Studio 3T)

# Access Sefaria ORM
* You can access Sefaria's ORM by first running `cd ./web/Sefaria-Project && pip install -r requirements.txt` and then either
  * `cd ./web/Sefaria-Project && ./cli -i`. This will open an interactive ipython shell. From here you can access any class in [this file](https://github.com/Sefaria/Sefaria-Project/blob/master/sefaria/model/__init__.py). These classes represent Sefaria's ORM
  * Add `DJANGO_SETTINGS_MODULE=sefaria.settings` to your envvars. Add `./web/Sefaria-Project` to your PYTHONPATH. Then in any new Python script, you can include this to access Sefaria's ORM:

```python
import django
django.setup()
from sefaria.model import *
```

# Tips
In `web/local_settings.py`, change `DISABLE_AUTOCOMPLETER` to `True` for much faster startup time, at the cost of the fact that the frontend will not have the autocompleter. If you're not using the frontend, this shouldn't affect your usage.

