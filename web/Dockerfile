 FROM python:3.8
 
 ENV PYTHONUNBUFFERED 1
 ENV PYTHONPATH /www
 ENV DJANGO_SETTINGS_MODULE sefaria.settings
 
 RUN apt-get -y update \ 
   && apt-get -y upgrade \
   && apt-get install -y sqlite3 libsqlite3-dev gettext build-essential

 RUN mkdir /db \
  && /usr/bin/sqlite3 /db/db.sqlite

 RUN mkdir /www \
  && mkdir /www/log
 
 # This assumes that code is already in ./Sefaria-Project 
 COPY ./Sefaria-Project /www/
 
 WORKDIR /www

 # install pyre2
 RUN pip install cython
 RUN cd /tmp && git clone https://github.com/google/re2.git && cd re2 && make install && rm -rf /tmp/re2
 RUN cd /tmp && git clone https://github.com/andreasvc/pyre2 && cd pyre2 && python setup.py install && rm -rf /tmp/pyre2
 
 RUN pip install -r requirements.txt \
  && cp -R ./locale/en/LC_MESSAGES/ /usr/local/lib/python3.8/site-packages/django/conf/locale/en
 
 ENV NVM_DIR /usr/local/nvm

 # Install nvm with node and npm
 RUN mkdir -p "$NVM_DIR" \
  && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash \
  && . $NVM_DIR/nvm.sh \
  && nvm install node \  
  && npm install \
  && npm run build
