#!/bin/bash

# Define your environment variables here
DB_CONTAINER_NAME="database"
DB_NAME="main"
DB_USER="main"
DB_PASSWORD="hHMP8cd^N3SnzGRR"
DB_PORT=5432
DB_VOLUME="postgres_data"

git_pull_force() {
	git reset --hard HEAD
	git clean -f -d
	git pull origin main
}

cd ~/$DB_CONTAINER_NAME
git_pull_force;

# Danach machen wir ein Backup der Datenbank, falls bei der Migration etwas schiefgehen sollte.
cd ~/backups/
BACKUP_FILENAME="$(date +"%Y-%m-%d_%H-%M-%S").sql.gz"
docker exec -t $DB_CONTAINER_NAME pg_dumpall -c -U $DB_USER | gzip > $BACKUP_FILENAME

# Wir stoppen die Datenbank und rebuilden das Backup
docker stop $DB_CONTAINER_NAME

# Wir entfernen das "database" Image um Komplikationen vorzusorgen
docker rm $DB_CONTAINER_NAME

# Wir erstellen ein docker volume, damit wir unsere PostgreSQL Daten sichern können.
docker volume rm $DB_VOLUME
docker volume create $DB_VOLUME

# Und starten einen neuen "database" container.
cd ~/$DB_CONTAINER_NAME
docker build -t $DB_CONTAINER_NAME .
docker run -d --name $DB_CONTAINER_NAME -e POSTGRES_USER=$DB_USER -e POSTGRES_PASSWORD=$DB_PASSWORD -p $DB_PORT:5432 -v $DB_VOLUME:/var/lib/postgresql/data $DB_CONTAINER_NAME

# Wir müssen warten bis die Datenbank wieder läuft.
while ! docker exec $DB_CONTAINER_NAME pg_isready -U $DB_USER -h localhost -p $DB_PORT > /dev/null 2>&1; do
    sleep 1
done

# Und wenden das Backup an.
gunzip -c $BACKUP_FILENAME | docker exec -i $DB_CONTAINER_NAME psql -U $DB_USER