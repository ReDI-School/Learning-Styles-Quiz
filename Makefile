DEFAULT_GOL: run

bundle:
	echo "✅ installing plugins"
	@bundle

generate-db:
	echo "✅ generating database"
	@rake db:migrate
	@rake db:seed

run:
	make bundle generate-db
	echo "✅ launching aplication "
	@ruby bin/run.rb

