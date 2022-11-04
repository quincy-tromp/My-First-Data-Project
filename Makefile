include venv/pyvenv.cfg
hello:
	@echo "Hello again"
transform:
	@python transform.py
load:
	@python load.py
cleanup:
	@python cleanup.py
complete:
	@echo "process completed"
all: hello transform load cleanup complete