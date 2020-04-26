COMMIT_HASH := $(shell git rev-parse --short HEAD)

build:
	@docker build \
		--tag rorono/rails:ruby-2.7.1-node-12.16.2 \
		./ruby-2.7.1-node-12.16.2
	@docker build \
		--tag rorono/rails:ruby-2.7.1-node-14.0.0 \
		./ruby-2.7.1-node-14.0.0
	@echo "build done."

push:
	@docker push rorono/rails
	@echo "push done."
