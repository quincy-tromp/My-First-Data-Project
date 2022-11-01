LOAD DATA LOCAL INFILE '~/Downloads/transactions.csv' INTO TABLE transactions
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  
(@Transactiedatum,@Transactiebedrag,@Label) set transaction_dt=@Transactiedatum,amount=@Transactiebedrag,label=@Label;
