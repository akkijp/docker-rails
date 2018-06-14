build:
	@docker build --tag rails:ruby-2.5.1-node-8.11.3 ./ruby-2.5.1-node-8.11.3
	@echo "build"

push:
	@docker push rorono/rails
	@echo "push"
