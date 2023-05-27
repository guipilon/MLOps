APP_NAME=app.py
APP_DIR=webapp

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	python3 -m pylint --disable=R,C $(APP_DIR)/$(APP_NAME)

test:
	python3 -m pytest -vv $(APP_DIR)/test_$(APP_NAME)

clean: 
	rm -rf __pycache__
	rm -rf venv

venv/bin/activate: requirements.txt
	python3 -m venv venv
	./venv/bin/pip install -r requirements.txt

run: venv/bin/activate
	./venv/bin/python3 $(APP_DIR)/$(APP_NAME)

format:
	python3 -m isort -r .
	python3 -m black -l 79 .
