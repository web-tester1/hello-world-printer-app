.PHONY: test deps

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

# pip install flake8
lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

test_with_cov:
	PYTHONPATH=. py.test -s --cov=. --cov-report xml --junit-xml=test_results.xml

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

docker_build:
	docker build -t hello-wold-printer .

docker_run: docker_build
	docker run \
	   --name hello-wold-printer-dev \
	   -p 5000:5000 \
	   -d hello-wold-printer

USERNAME=wsbtester1
TAG=$(USERNAME)/hello-wold-printer

docker_push:
	@docker login --username $(USERNAME) --password $(PASSWORD)  ; \
	docker tag hello-wold-printer $(TAG); \
	docker push $(TAG); \
	docker logout;
