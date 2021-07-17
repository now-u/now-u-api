PONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Start api
	docker-compose up

test: ## Run tests
	docker-compose run --rm api bundle exec rspec

build: ## Build api image
	docker-compose build api
