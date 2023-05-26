install:
	poetry install

run:
	poetry run python app.py

docker-build:
	docker-compose build

docker-run:
	docker-compose up

.PHONY: install run docker-build docker-run
