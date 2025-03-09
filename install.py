import os

def install_app():
    print("✅ installing learning styles app")
    os.system('bundle')
    print("⏳ generating database")
    os.system('rake db:migrate')
    print("⏳ finishing setup")
    os.system('rake db:seed')

def run_app():
    print("✅ launching learning styles app")
    os.system('ruby bin/run.rb')

if not os.path.isfile('db/development.db'):
    install_app()
    run_app()
else:
    run_app()