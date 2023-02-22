setup:
	bin/setup

start:
	bin/rails s -p 3000 -b "0.0.0.0"

console:
	bin/rails console

test:
	bin/rails assets:precompile
	NODE_ENV=test bin/rails test

.PHONY: test
