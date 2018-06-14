build:
	@docker build --tag rorono/rails:ruby-2.5.0-node-8.12.3 ./ruby-2.5.0-node-8.12.3
	@docker build --tag rorono/rails:ruby-2.5.1-node-8.11.3 ./ruby-2.5.1-node-8.11.3
	@echo "build"

push:
	@docker push rorono/rails
	@echo "push"
