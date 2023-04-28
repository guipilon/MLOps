VENV_PATH='env/bin/activate'
ENVIRONMENT_VARIABLE_FILE='.env'

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	python -m pylint --disable=R,C main.py

test:
	python -m pytest -vv test_main.py

clean: 
	rm -rf __pycache__
	rm -rf venv

run: 
	export FLASK_APP=main.py
	export FLASK_ENV=development
	python -m flask run

format:
	python -m isort -r .
	python -m black -l 79 .
