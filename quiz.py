from learning_styles_quiz.install import install_app, run_app
import os

os.chdir('learning_styles_quiz')
database = "db/development.db"

#  check if database is created
if not os.path.isfile(database):
    install_app() # install dependencies and database
    run_app()
else:
    run_app()