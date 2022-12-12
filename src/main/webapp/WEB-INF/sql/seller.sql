CREATE TABLE tb_seller
(
    sl_id       varchar(20)  NOT NULL PRIMARY KEY -- 판매자ID
    ,
    sl_pw       varchar(20)  NOT NULL             -- 판매자PW
    ,
    sl_name     varchar(30)  NOT NULL             -- 사업자명
    ,
    sl_adr1     varchar(255) NOT NULL             -- 주소1
    ,
    sl_adr2     varchar(255) NOT NULL             -- 주소2
    ,
    sl_phone    varchar(20)  NOT NULL             -- 연락처
    ,
    sl_birth    date         NOT NULL             -- 생년월일
    ,
    sl_grade    varchar(20)  NOT NULL             -- 회원등급
    ,
    sl_receive  char(1)      NOT NULL             -- 수신여부
    ,
    sl_number   varchar(12)  NOT NULL             -- 사업자번호
    ,
    sl_bank     varchar(30)  NOT NULL             -- 계좌번호
    ,
    sl_bankcode int          NOT NULL             -- 은행코드
);

INSERT INTO tb_seller (sl_id, sl_pw, sl_name, sl_adr1, sl_adr2, sl_phone, sl_birth, sl_grade, sl_receive, sl_number, sl_bank, sl_bankcode)
VALUES ('ekdm1234', '1q2w3e4r!', '닌텐돌', '경기도 성남시 분당구 정자일로', '95', '031-1111-2222', '19801002', 'SVIP', 'Y', '123-12-12345', '110-36-2345-474', 4)
     ,('pogjj777', 'qwerty33!!', '닝텐도', '서울특별시 강남구 테헤란로', '124 4층', '02-5566-3344', '19900428', 'SGOLD', 'Y', '392-48-38727', '396-4804-9385-11', 11)
     ,('digj1908', 'dkanrjsk33', '닌텡도', '경기도 성남시 분당구 판교역로241번길', '20', '010-9977-4567', '19750530', 'SGOLD', 'N', '698-29-28744', '3454-334-583492', 88)
     ,('itwill', 'dkdk123', '닝텡동', '강원도 양구군 남면 삼팔선로', '112', '010-0101-2222', '19990202', 'SSILVER', 'Y', '123-16-45645', '110-462-057303', 4)
     ,('codingking', 'dodomk159', '링딩동', '경기도 평택시 세교3로 8', '102-702', '010-0225-1475', '19950626', 'SGREEN', 'N', '456-45-78978', '110-568-159456', 4);


drop table tb_seller;

select * from tb_seller;

-- 회원등급
SELECT sl_grade
FROM tb_seller
WHERE sl_id='itwill' AND sl_pw='dkdk123' AND sl_grade IN ('SVip', 'SGold', 'SSilver', 'SBronze', 'SNew');