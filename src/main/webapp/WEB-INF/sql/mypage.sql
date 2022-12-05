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
