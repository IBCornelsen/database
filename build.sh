#!/bin/bash

# Define your environment variables here
DB_CONTAINER_NAME="database"
DB_NAME="main"
DB_USER="main"
DB_PASSWORD="hHMP8cd^N3SnzGRR"
DB_PORT=5432
DB_VOLUME="postgres_data"

# Wir gehen davon aus, dass die Änderungen bereits von GitHub gepullt wurden
# Dieses Skript ist nur dafür gedacht, von GitHub bei einer Automation
# ausgeführt zu werden. Außerdem würde es nicht wirklich Sinn ergeben, wenn das
# Build Skript sich die Änderungen am build Skript holen würde...

# Als erstes linken wir das package mit yalc, damit wir z.B. in online-energieausweis darauf zugreifen können.
bunx yalc push
# Dann installieren wir noch einmal alle dependencies, das ist besonders wichtig
# falls wir lokal verlinkte Projekte haben, sonst werden die nicht in unser
# docker image übernommen
bun install

# Jeder unserer Applikationen hat ein Verzeichnis in dem alle Dateien dauerhaft,
# Versionsunabhängig gespeichert werden. Dieses legen wir hier an, falls es noch
# nicht existiert.
PERSISTENT_DIR="${HOME}/persistent/${APP_NAME}";
mkdir -p $PERSISTENT_DIR;

# Danach machen wir ein Backup der Datenbank, falls bei der Migration etwas schiefgehen sollte.
BACKUP_FILENAME="${HOME}/backups/$(date +"%Y-%m-%d_%H-%M-%S").sql.gz"
docker exec -t $DB_CONTAINER_NAME pg_dump --data-only -U $DB_USER main | gzip > $BACKUP_FILENAME

# Wir stoppen die Datenbank und rebuilden das Backup
docker stop $DB_CONTAINER_NAME

# Wir entfernen das "database" Image um Komplikationen vorzusorgen
docker rm $DB_CONTAINER_NAME

# Wir erstellen ein docker volume, damit wir unsere PostgreSQL Daten sichern können.
docker volume rm $DB_VOLUME
docker volume create $DB_VOLUME

# Und starten einen neuen "database" container.
docker build -t $DB_CONTAINER_NAME .
docker run -d --name $DB_CONTAINER_NAME \
	-e POSTGRES_USER=$DB_USER \
	-e POSTGRES_PASSWORD=$DB_PASSWORD \
	-p $DB_PORT:5432 \
	-v $DB_VOLUME:/var/lib/postgresql/data \
	-v "${PERSISTENT_DIR}:/persistent" \
	$DB_CONTAINER_NAME

# Wir müssen warten bis die Datenbank wieder läuft.
while ! docker exec $DB_CONTAINER_NAME pg_isready -U $DB_USER -h localhost -p $DB_PORT > /dev/null 2>&1; do
    sleep 1
done

# Und wenden das Backup an.
gunzip -c $BACKUP_FILENAME | docker exec -i $DB_CONTAINER_NAME psql -U $DB_USER -d postgres