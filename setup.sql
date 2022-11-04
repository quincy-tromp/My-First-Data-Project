drop database if exists MF_DB;

create database MF_DB;

use MF_DB;

drop table if exists labels;

create table labels 
( 	label varchar(32) ,
    category varchar(32) not null ,
    transaction_type varchar(32) not null ,
    constraint label_pk primary key (label) );

drop table if exists transactions;

create table transactions
(	transaction_dt date not null ,
    amount decimal(8,2) not null ,
    label varchar(32) not null ,
    constraint trans_pk primary key (transaction_dt, amount, label) , 
    constraint label_fk foreign key (label) references labels (label) );

load data local infile '/Users/quincytromp/Projects/My_Finance_DB/populate.csv' into table labels
fields terminated by ',' lines terminated by '\n' 
(@Label,@Transaction_type,@Category) set label=@Label,transaction_type=@Transaction_type,category=@Category;