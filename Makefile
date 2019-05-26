.PHONY: presetup venv setup help


help:
	@echo '`make help`         show this message'
	@echo '`make presetup`     will install python 3.7, pydev, pip and pipenv'
	@echo '`make venv`         will create pipenv with python3.7 as default python'
	@echo '                    also it will install project dependencies'
	@echo '`make setup`        will run `make presetup` and `make venv`'
	@echo '-----------------------------------------------------------------------'
	@echo 'If you need an additional info about pipenv package you just'
	@echo 'need to type `pipenv`'
	@echo 'For exit from pipenv shell use `exit` command or `Ctrl+D`'


presetup:
	@echo 'Prepare stage'
	@echo 'Installing python 3.7'
	sudo apt-get install python3.7
	@echo 'Install pydev, pip'
	sudo apt-get install python3.7-dev python3-pip
	sudo python3.7 -m pip install pipenv


venv:
	@echo 'Creating venv'
	pipenv --python 3.7
	pipenv run pip3 install -r requirements/requirements.txt
	pipenv lock
	@echo 'Venv created'


setup:
	@echo '------- Setting up environment -------'
	make presetup
	make venv
