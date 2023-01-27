setup:
	bin/setup
	yarn install

start:
	bin/rails s -p 3000 -b "0.0.0.0"

console:
	bin/rails console

test:
	NODE_ENV=test bin/rails test
	cat Gemfile | grep simple_form

.PHONY: test
