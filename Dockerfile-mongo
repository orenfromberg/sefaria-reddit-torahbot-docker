FROM mongo

# Modify child mongo to use /data/db2 as dbpath (because /data/db wont persist the build)
RUN mkdir -p /data/db2 \
    && echo "dbpath = /data/db2" > /etc/mongodb.conf \
    && chown -R mongodb:mongodb /data/db2

# Initialize logfile
RUN touch /var/log/mongodb.log \
	&& chmod 777 /var/log/mongodb.log

# Assumes that mongo dump is in ./dump    
COPY dump /home/dump
COPY mongo-restore.sh /home/mongo-restore.sh
RUN chmod 777 /home/mongo-restore.sh

# Restore database and change permission on all data files
RUN /home/mongo-restore.sh
RUN chown -R mongodb /data/db2

# Make new database a volume, in order to persist it. 
VOLUME /data/db2

CMD ["mongod", "--config", "/etc/mongodb.conf", "--bind_ip_all"]
