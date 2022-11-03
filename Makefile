hello:
	@echo "Hello"
extract:
	@echo "Start extracting..."
	@./extract.sh
transform:
	@echo "Start transforming..."
	@source ~/Projects/PF_DB/venv/config.cfg
	@python transform_csv.py ${FPATH}
load:
	@echo "Start loading..."
	@source ~/Projects/PF_DB/venv/config.cfg
	@source ~/Projects/PF_DB/venv/mylogin.cfg
	@mysql --local-infile=1 -u"${DB_USER}" -p"${DB_USER_PASSWORD}" 2> /dev/null -e "USE PF_DB; LOAD DATA LOCAL INFILE '${FPATH}' INTO TABLE transactions \
	FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' \
	(@Transactiedatum,@Transactiebedrag,@Label) set transaction_dt=@Transactiedatum,amount=@Transactiebedrag,label=@Label; \
	commit;" 
cleanup:
	@echo "Start cleanup..."
	@source ~/Projects/PF_DB/venv/config.cfg
	@rm ${FPATH}
complete:
	@echo "Process complete."
all: hello extract transform load cleanup complete