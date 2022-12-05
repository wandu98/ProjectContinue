show databases;

create database practice;

SET foreign_key_checks = 1;

use practice;
use nonchrono;

create table tb_game
(
    gm_code     varchar(100) not null primary key,
    gm_name     varchar(255) not null,
    gm_price    int          not null,
    gm_level    varchar(100) not null,
    gm_category varchar(100) not null,
    gm_img    varchar(255) not null
);

drop table tb_game;

select *
from tb_game;

insert into tb_game(gm_code, gm_name, gm_price, gm_level, gm_category)
values (${gm_code}, ${gm_name}, ${gm_price}, ${gm_level}, ${gm_category});

select gm_name
from tb_game;