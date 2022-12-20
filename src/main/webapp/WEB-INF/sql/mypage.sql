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


select ifnull(count(*), 0)
from tb_wish
where mem_id = 'ewok777'
group by mem_id;


select count(*)
from tb_wish
where mem_id = 'ewok777'
group by mem_id;

select ifnull(max(count), 0) as cnt
from (
        select count(*) as count
        from tb_wish
        where mem_id = 'ewok777'
        group by mem_id
    ) AA ;




select rb.rcrbrd_num, rcrbrd_subject, rb.gm_code, gm_name, rcrbrd_edate, count(*) as cnt
from tb_rcrboard rb join tb_recruitinfo tr
on rb.rcrbrd_num = tr.rcrbrd_num join tb_game tg
on rb.gm_code = tg.gm_code
where rb.mem_id = 'fjhdmj555'
group by rb.rcrbrd_num
order by rcrbrd_num;


delimiter //
create trigger trigger_coupon
after insert on tb_mem
for each row
begin
    if new.mem_id = new.mem_id then
        insert into tb_couponlist(cp_code, mem_id)
        values ('A0002', new.mem_id);
    end if;
end; //
delimiter ;


select rcrbrd_num, rcrbrd_subject, rb.gm_code, rcrbrd_edate, gm_name
from tb_rcrboard rb join tb_game ga
on rb.gm_code = ga.gm_code
where mem_id = 'fjhdmj555'
order by rcrbrd_num;

select count(*) as cnt
from tb_recruitinfo
where rcrbrd_num = 4;