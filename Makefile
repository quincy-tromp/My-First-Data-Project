hello:
	@echo "Hello again"
transform:
	@python transform.py
load:
	@python load.py
cleanup:
	@echo "Start cleanup..."
	@source ~/Projects/PF_DB/venv/config.cfg
	@rm ${FPATH}
complete:
	@echo "process completed"
all: hello extract transform load cleanup complete