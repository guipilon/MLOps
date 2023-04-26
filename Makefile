install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	python -m pylint --disable=R,C hello.py

test:
	python -m pytest -vv test_hello.py

clean: 
	rm -rf __pycache__

run:
	python hello.py

format:
	python -m isort -r .
	python -m black -l 79 .