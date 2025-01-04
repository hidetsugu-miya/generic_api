.DEFAULT_GOAL := usage
NETWORK_NAME = exchange-rate-network

init: network.create build bundle db.migrate

network.create:
	@if [ -z "`docker network ls | grep $(NETWORK_NAME)`" ]; then docker network create $(NETWORK_NAME); fi

build:
	docker compose build

up: network.create
	rm -f tmp/pids/server.pid
	docker compose up

down:
	docker compose down

stop:
	docker compose stop

bundle:
	docker compose run --rm app bundle install -j4

console:
	docker compose run --rm app bundle exec rails console

db.up: network.create
	docker compose up db -d

db.migrate: db.up
	docker compose run --rm app bundle exec rails db:create db:migrate

db.seed: db.up
	docker compose run --rm app bundle exec rails db:seed_fu

db.reset: db.up
	docker compose run --rm app bundle exec rails db:drop db:create db:migrate
	docker compose run --rm -e RAILS_ENV=test app bundle exec rails db:migrate

rubocop:
	docker compose run --rm app bundle exec rubocop

bash:
	docker compose run --rm app /bin/bash