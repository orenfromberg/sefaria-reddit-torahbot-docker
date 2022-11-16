FROM python:3.8

ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH /www
ENV DJANGO_SETTINGS_MODULE sefaria.settings

RUN apt-get -y update \ 
  && apt-get -y upgrade \
  && apt-get install -y sqlite3 libsqlite3-dev gettext cmake ninja-build python3-dev cython3 pybind11-dev libre2-dev

RUN mkdir /db \
  && /usr/bin/sqlite3 /db/db.sqlite

RUN mkdir /www \
  && mkdir /log

COPY ./Sefaria-Project/requirements.txt /www/

WORKDIR /www

# install pyre2
RUN pip install cython pyre2
RUN pip install -r requirements.txt

COPY ./Sefaria-Project /www/

RUN cp -R ./locale/en/LC_MESSAGES/ /usr/local/lib/python3.8/site-packages/django/conf/locale/en