PONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Start api
	docker-compose up

test: ## Run tests
	docker-compose exec api bundle exec rspec spec/requests/api/v2/causes_request_spec.rb

build: ## Build api image
	docker-compose build api

swag-generate: ## Generate swagger spec
	docker-compose exec api bundle exec rake rswag:specs:swaggerize

create-empty-migration: ## Create an empty migration 
	docker-compose exec api rails g migration
