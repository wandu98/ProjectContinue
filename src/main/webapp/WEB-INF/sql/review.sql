select count(*)
from tb_review
where mem_id = 'oejdf9090';


select *
from tb_review
where mem_id = 'fjhdmj555';

select rv_num, mem_id, rv_content, rv_star, rv_filename, ss_num
from tb_review
where mem_id = 'fjhdmj555';

select *, @rno := @rno + 1 as r
from (
        select rv_num, mem_id, rv_content, rv_star, rv_filename, ss_num
        from tb_review
        where mem_id = 'fjhdmj555'
     ) AA, (select @rno := 0) BB;


select *
from (
        select *, @rno := @rno + 1 as rnum
        from (
                select rv_num, mem_id, rv_content, rv_star, rv_filename, ss_num
                from tb_review
                where mem_id = 'fjhdmj555'
             ) AA, (select @rno := 0) BB
    ) CC
where rnum>=1 and rnum<=5;


select rv_num, mem_id, rv_content, rv_star, rv_filename, ss_num, rv_date
from tb_review
where rv_num = 7;


update tb_review
set rv_content = '한때의 꿈이다', rv_star = 4, rv_filename = 'dream2.jpg'
where rv_num = 7;