FROM postgres:latest

USER postgres

RUN /etc/init.d/postgresql start && pysql --command "CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres' ;" && createdb -O postgres api

EXPOSE 5432


COPY . . 
