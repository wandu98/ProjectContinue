
SET foreign_key_checks = 1;

show databases;

create database practice;

use practice;
use nonchrono;

drop table tb_rcrboard;

select * from tb_rcrboard;

select gm_name
from tb_game gm
left join tb_rcrboard rb on rb.gm_code = gm.gm_code
where rb.gm_code = 'DT1';

select rb.rcrbrd_num, rb.mem_id, rb.rcrbrd_subject, rb.rcrbrd_content, rb.rcrbrd_pw, rb.rcrbrd_views, rb.rcrbrd_date, rb.rcrbrd_edate, rb.rcrbrd_ip, rb.gm_code, rb.rcrbrd_status, rb.rcrbrd_adr, rb.rcrbrd_max, gm.gm_name
from tb_game as gm join tb_rcrboard as rb
on rb.gm_code = gm.gm_code;

truncate table tb_rcrboard;