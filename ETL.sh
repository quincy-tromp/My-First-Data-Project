#!/bin/zsh

FILENAME=`ls ~/Downloads/*.csv`&& FPATH=`readlink -f $FILENAME`
echo "\nexport FPATH=${FPATH}" >> venv/.mylogin.cfg

# python transform_csv.py $FPATH

# mysql --local-infile=1 -u${DB_USER} -p${DB_USER_PASSWORD} 2> /dev/null << here-doc
# USE PF_DB
# LOAD DATA LOCAL INFILE '$FPATH' INTO TABLE transactions
# FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  
# (@Transactiedatum,@Transactiebedrag,@Label) set transaction_dt=@Transactiedatum,amount=@Transactiebedrag,label=@Label;
# commit;
# here-doc

# rm $FPATH