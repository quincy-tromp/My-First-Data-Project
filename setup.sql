drop database if exists PF_DB;

create database PF_DB;

use PF_DB;

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