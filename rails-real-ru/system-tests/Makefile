setup:
	bin/setup
	bin/rails db:fixtures:load

start:
	bin/rails s -p 3000 -b "127.0.0.1"

console:
	bin/rails console

test:
	bin/rails assets:precompile
	firefox -v || sudo apt install -y firefox
	MOZ_HEADLESS=1 NODE_ENV=test bin/rails test

.PHONY: test
