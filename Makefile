.PHONY: backup run_database build_database install_dependencies wait_for_database prod

# Environment variables
DB_CONTAINER_NAME := database
DB_NAME := main
DB_USER := main
DB_PASSWORD := hHMP8cd^N3SnzGRR
DB_PORT := 5432
DB_VOLUME := postgres_data
PERSISTENT_DIR := $(HOME)/persistent/$(APP_NAME)
BACKUP_FILENAME := $(HOME)/backups/$(shell date +"%Y-%m-%d_%H-%M-%S").sql.gz

prod: install_dependencies backup run_database wait_for_database

install_dependencies:
	bun install

backup:
	mkdir -p $(PERSISTENT_DIR)
	docker exec -t $(DB_CONTAINER_NAME) pg_dump --data-only -U $(DB_USER) $(DB_NAME) | gzip > $(BACKUP_FILENAME)

run_database: stop_database
	docker volume rm -f $(DB_VOLUME)
	docker volume create $(DB_VOLUME)
	docker build -t $(DB_CONTAINER_NAME) .
	docker run -d --name $(DB_CONTAINER_NAME) \
		-e POSTGRES_USER=$(DB_USER) \
		-e POSTGRES_PASSWORD=$(DB_PASSWORD) \
		-p $(DB_PORT):5432 \
		-v $(DB_VOLUME):/var/lib/postgresql/data \
		-v $(PERSISTENT_DIR):/persistent \
		$(DB_CONTAINER_NAME)

stop_database:
	-docker stop $(DB_CONTAINER_NAME)
	-docker rm $(DB_CONTAINER_NAME)

wait_for_database:
	@while ! docker exec $(DB_CONTAINER_NAME) pg_isready -U $(DB_USER) -h localhost -p $(DB_PORT) > /dev/null 2>&1; do \
		sleep 1; \
	done

restore_backup:
	gunzip -c $(BACKUP_FILENAME) | docker exec -i $(DB_CONTAINER_NAME) psql -U $(DB_USER) -d postgres
