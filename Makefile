VENV_PATH='env/bin/activate'
ENVIRONMENT_VARIABLE_FILE='.env'

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	python -m pylint --disable=R,C hello.py

test:
	python -m pytest -vv test_hello.py

clean: 
	rm -rf __pycache__
	rm -rf venv

run: 
	python hello.py

format:
	python -m isort -r .
	python -m black -l 79 .
