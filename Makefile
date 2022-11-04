hello:
	@echo "Hello"
extract:
	@echo "Start extracting..."
	@./extract.sh
transform:
	@python transform.py
load:
	@python load.py
cleanup:
	@echo "Start cleanup..."
	@source ~/Projects/PF_DB/venv/config.cfg
	@rm ${FPATH}
complete:
	@echo "Process complete."
all: hello extract transform load cleanup complete