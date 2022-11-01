LOAD DATA LOCAL INFILE '~/Downloads/Oct-2022.csv' INTO TABLE transactions
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  
(@Transactiedatum,@Transactiebedrag,@Label) set transaction_dt=@Transactiedatum,amount=@Transactiebedrag,label=@Label;
