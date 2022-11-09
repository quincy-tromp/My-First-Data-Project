drop database if exists My_DB;

create database My_DB;

use My_DB;

drop table if exists labels;

create table labels 
( 	label varchar(32) ,
    category varchar(32) not null ,
    transaction_type varchar(32) not null ,
    constraint pk_label primary key (label) );

drop table if exists transactions;

create table transactions
(	transaction_id int not null auto_increment ,
    transaction_dt date not null ,
    amount decimal(8,2) not null ,
    label varchar(32) not null ,
    constraint pk_transaction primary key (transaction_id) , 
    constraint fk_label foreign key (label) references labels (label) );

load data local infile '/Users/quincytromp/Projects/My-First-Data-Project/populate.csv' into table labels
fields terminated by ',' lines terminated by '\n' 
(@Label,@Transaction_type,@Category) set label=@Label,transaction_type=@Transaction_type,category=@Category;