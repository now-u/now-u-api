FROM postgres:9.4

ADD ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
CMD ["postgres"]
