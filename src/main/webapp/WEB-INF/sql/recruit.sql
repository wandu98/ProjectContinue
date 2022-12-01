
show databases;

create database practice;

use practice;
use nonchrono;

select * from tb_rcrboard;

select gm_name
from tb_game gm
left join tb_rcrboard rb on rb.gm_code = gm.gm_code
where rb.gm_code = ?;