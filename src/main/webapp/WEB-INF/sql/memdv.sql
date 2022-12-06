select mem_dvinfo, mem_dvadr1, mem_dvadr2, mem_dvphone, mem_dvnick
from tb_memdv
where mem_id = 'fjhdmj555';


select mem_dvnum, mem_dvinfo, mem_dvadr1, mem_dvadr2, mem_dvphone, mem_dvnick
from tb_memdv
where mem_id = 'fjhdmj555';

update tb_memdv
set mem_dvadr2 = '97'
where mem_dvnum = 3;

update tb_memdv
set mem_dvinfo = #{mem_dvinfo}, mem_dvard1 = #{mem_dvadr1}, mem_dvadr2 = #{mem_dvadr2}, mem_dvphone = #{mem_dvphone}, mem_dvnick = #{mem_dvnick}
where mem_dvnum = #{mem_dvnum}


