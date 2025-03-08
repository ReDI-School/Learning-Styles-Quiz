install:
	bundle

generate-db:
	rake db:migrate
	rake db:seed