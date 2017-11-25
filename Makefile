
help:					## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help


d-build:			## Build the Docker image (sammlerio/rabbitmq).
	docker build -t sammlerio/strategy-heartbeat .
.PHONY: d-build

d-run:				## Run the Docker image (sammlerio/rabbitmq)
	docker run -it sammlerio/strategy-heartbeat
.PHONY: d-run

gen-readme:		## Generate the README.md file.
	docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb
.PHONY: gen-readme
