set @date = '2022-09-30';

delete from transactions
where transaction_dt >= @date;