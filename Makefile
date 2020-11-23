COMMIT_HASH := $(shell git rev-parse --short HEAD)

build:
	@docker build \
		--tag rorono/rails:ruby-2.6.6-node-12.16.1 \
		./ruby-2.6.6-node-12.16.1
	@echo "build done."

push:
	@docker push rorono/rails
	@echo "push done."
