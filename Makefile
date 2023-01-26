PONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Start api
	docker-compose up

test: ## Run tests
	docker-compose run --rm api bundle exec rspec

build: ## Build api image
	docker-compose build api

swag-generate: ## Generate swagger spec
	docker-compose exec api bundle exec rake rswag:specs:swaggerize

migrate: ## Run migrations
	docker-compose exec api rails db:migrate

create-empty-migration: ## Create an empty migration 
	docker-compose exec api rails g migration
