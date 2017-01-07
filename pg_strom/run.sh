#!/bin/bash
chown postgres. /data
PGDATA=/data/pg_strom
if [ ! -d $PGDATA ]; then
  sudo -u postgres /usr/local/postgresql/bin/initdb $PGDATA
  cp /etc/postgresql.conf.sample $PGDATA/postgresql.conf
  cp /etc/pg_hba.conf.sample $PGDATA/pg_hba.conf
fi
sudo -u postgres /usr/local/postgresql/bin/postgres -D $PGDATA
