bundle-install:
	docker-compose run --rm web bundle install --without production

bundle-update:
	docker-compose run --rm web bundle update

db-reinstall:
	docker-compose run --rm web bundle exec rails db:reinstall RAILS_ENV=development

annotate:
	docker-compose run --rm web bundle exec rails annotate

rc:
	docker-compose run --rm web bundle exec rails c

rspec:
	docker-compose run --rm web bundle exec rspec

rubocop:
	docker-compose run --rm web bundle exec rubocop

precompile:
	docker-compose run --rm web bundle exec rails assets:precompile RAILS_ENV=development

build:
	docker-compose build

up:
	docker-compose up

stop:
	docker-compose stop
