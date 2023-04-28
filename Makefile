VENV_PATH='env/bin/activate'
ENVIRONMENT_VARIABLE_FILE='.env'

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	python3 -m pylint --disable=R,C main.py

test:
	python3 -m pytest -vv test_main.py

clean: 
	rm -rf __pycache__
	rm -rf venv

venv/bin/activate: requirements.txt
	python3 -m venv venv
	./venv/bin/pip install -r requirements.txt

run: venv/bin/activate
	./venv/bin/python3 main.py

format:
	python3 -m isort -r .
	python3 -m black -l 79 .
