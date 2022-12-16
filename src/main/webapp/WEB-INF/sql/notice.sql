CREATE TABLE tb_nt
(
    nt_num     int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nt_title   varchar(255) NOT NULL,
    nt_cmt     text(5000)   NOT NULL,
    nt_regdate datetime     NOT NULL default now(),
    nt_views   int          NOT NULL default 0
);

INSERT INTO tb_nt (rownum, nt_title, nt_cmt, nt_regdate, nt_views)
VALUES ('' , '[공지] 닌텐도 다운로드(디지털) 상품, ★★★[지금 다운로드] 이용 안내 ★★★', '※다운로드가 진행되지 않는 경우에는 본체를 슬립으로 하거나 소프트웨어를 종료해 주십시오.', '20210224', 826741)
     ,('', '[공지] 소프라노를 알차게 이용하는 회원 기본 혜택 안내', '소프라노 회원님께만 드리는 다양한 기본 혜택을 안내드립니다', '20191021', 869291)
     ,('', '[공지] PlayStation VR2 11월 추첨 판매 공지', '상품의 추첨 판매를 진행하여 아래와 같이 공지 드립니다.', '20221114', 5369);

UPDATE tb_nt
SET nt_title = '안녕', nt_cmt = '하세용'
WHERE nt_num = 1


CREATE TABLE tb_nt
(
    rownum int NOT NULL ,
    nt_num     int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nt_title   varchar(255) NOT NULL,
    nt_cmt     text(5000)   NOT NULL,
    nt_regdate datetime     NOT NULL default now(),
    nt_views   int          NOT NULL default 0
);


SELECT * from tb_nt;
drop table tb_nt;


SET @rownum:=0;
SELECT
@rownum:=@rownum+1
FROM tb_nt;

SELECT @ROWNUM:=@ROWNUM+1 AS rownum
FROM tb_nt, (SELECT @ROWNUM:=0) AS R
