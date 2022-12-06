# first stage: import sefaria dump
FROM mongo:4.4.13 AS stage1

# Modify child mongo to use /data/db2 as dbpath (because /data/db wont persist the build)
RUN mkdir -p /data/db2 \
    && echo "dbpath = /data/db2" > /etc/mongodb.conf \
    && chown -R mongodb:mongodb /data/db2

# Initialize logfile
RUN touch /var/log/mongodb.log \
	&& chmod 777 /var/log/mongodb.log

# Assumes that mongo dump is in ./dump    
COPY dump_small.tar.gz /tmp
COPY mongo-restore.sh /tmp/mongo-restore.sh
RUN chmod 755 /tmp/mongo-restore.sh

# Restore database and change permission on all data files
RUN /tmp/mongo-restore.sh
RUN chown -R mongodb /data/db2

# state 2: copy the data we got from stage 1, but lose the dump files
FROM mongo:4.4.13

# configure mongo to use dump from stage 1
RUN echo "dbpath = /data/db2" > /etc/mongodb.conf

# copy results from stage 1
COPY --from=stage1 /data/db2 /data/db2
RUN chown -R mongodb /data/db2

# Make new database a volume, in order to persist it
VOLUME /data
CMD ["mongod", "--config", "/etc/mongodb.conf", "--bind_ip_all"]
