build:
	@docker build \
		--tag rorono/rails:ruby-2.5.0-node-8.11.3 \
		--tag quay.io/rorono/rails:ruby-2.5.0-node-8.11.3 \
		./ruby-2.5.0-node-8.11.3
	@docker build \
		--tag rorono/rails:ruby-2.5.0-node-8.11.3-alpine \
		--tag quay.io/rorono/rails:ruby-2.5.0-node-8.11.3-alpine \
		./ruby-2.5.0-node-8.11.3-alpine
	@docker build \
		--tag rorono/rails:ruby-2.5.0-node-10.4.1 \
		--tag quay.io/rorono/rails:ruby-2.5.0-node-10.4.1 \
		./ruby-2.5.0-node-10.4.1
	@docker build \
		--tag rorono/rails:ruby-2.5.0-node-10.7.0 \
		--tag quay.io/rorono/rails:ruby-2.5.0-node-10.7.0 \
		./ruby-2.5.0-node-10.7.0
	@docker build \
		--tag rorono/rails:ruby-2.5.1-node-8.11.3 \
		--tag quay.io/rorono/rails:ruby-2.5.1-node-8.11.3 \
		./ruby-2.5.1-node-8.11.3
	@docker build \
		--tag rorono/rails:ruby-2.5.1-node-8.11.3-alpine \
		--tag quay.io/rorono/rails:ruby-2.5.1-node-8.11.3-alpine \
		./ruby-2.5.1-node-8.11.3-alpine
	@docker build \
		--tag rorono/rails:ruby-2.6.0-preview2-node-8.11.3 \
		--tag quay.io/rorono/rails:ruby-2.6.0-preview2-node-8.11.3 \
		./ruby-2.6.0-preview2-node-8.11.3
	@echo "build done."

push:
	@docker push rorono/rails
	@docker push quay.io/rorono/rails
	@echo "push done."
