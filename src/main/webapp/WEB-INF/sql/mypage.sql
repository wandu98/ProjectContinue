select mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad, mem_pic, mem_joindate
from tb_mem mem join tb_question qu
on mem.mem_id = qu.mem_id
where mem_id = 'oejdf9090';



select count(*)
from tb_question
where mem_id = 'oejdf9090'
group by mem_id;


select *
from tb_mem mem join (
                        select mem_id, count(*) as qcnt
                        from tb_question
                        where mem_id = 'oejdf9090'
                        group by mem_id
                    ) qu
on mem.mem_id = qu.mem_id;

update tb_mem
set mem_pic = 'ProfilePicture.png'
where mem_id = 'gjdjj888';


select rb.rcrbrd_num, rcrbrd_subject, rb.gm_code, gm_name, rcrbrd_edate, count(*) as cnt
from tb_rcrboard rb join tb_recruitinfo tr
on rb.rcrbrd_num = tr.rcrbrd_num join tb_game tg
on rb.gm_code = tg.gm_code
where rb.mem_id = 'fjhdmj555'
group by rb.rcrbrd_num
order by rcrbrd_num;