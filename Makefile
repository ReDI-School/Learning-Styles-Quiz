DEFAULT_GOL: run

bundle:
	@echo "✅ installing plugins"
	@bundle

generate-db:
	@echo "✅ generating database"
	@rake db:migrate
	@rake db:seed

install:
	make bundle generate-db
	@ruby bin/run.rb

run:
	@echo "✅ launching aplication "
	@ruby bin/run.rb
