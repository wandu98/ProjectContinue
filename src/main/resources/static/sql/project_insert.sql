-- 구천우
-- 상품
INSERT INTO tb_sales (gm_code, sl_id, ss_price, ss_speriod, ss_eperiod, ss_stock, ss_img, ss_status, ss_name,
                      ss_description, dv_num)
values ('DT0001', 'ekdm1234', 94800, '2022-11-23 15:00:00', '2099-12-31 15:00:00', 0, 'DT0001.png', '품절',
          '마리오＋래비드 킹덤 배틀8', '마리오입니다.', 1);

INSERT INTO tb_sales (gm_code, sl_id, ss_price, ss_speriod, ss_eperiod, ss_stock, ss_img, ss_status, ss_name, ss_description,
                      dv_num)
values ('MN0001', 'pogjj777', 360000, '2022-11-23 15:00:00', '2099-12-31 15:00:00', 0, 'MN0001.png', '판매 중', '닌텐도 스위치',
        '스위치다.', 2);

INSERT INTO tb_sales (gm_code, sl_id, ss_price, ss_speriod, ss_eperiod, ss_stock, ss_img, ss_status, ss_name, ss_description,
                      dv_num)
values ('DT0001', 'digj1908', 79800, '2022-11-23 15:00:00', '2099-12-31 15:00:00', 100, 'AC0001.png', '판매 중지',
        'SWITCH Joy-Con(L/R) 네온레드/네온블루', '조이콘이에요', 3);

INSERT INTO tb_sales (gm_code, sl_id, ss_price, ss_speriod, ss_eperiod, ss_stock, ss_img, ss_status, ss_name, ss_description,
                      dv_num)
values ('DT0002', 'itwill', 74800, '2022-11-23 15:00:00', '2099-12-31 15:00:00', 19, 'PT0001.jpg', '판매 중',
        '젤다의 전설 브레스 오브 더 와일드', '젤다입니다.', 4)
     , ('DT0003', 'codingking', 74800, '2022-11-23 15:00:00', '2099-12-31 15:00:00', 2, 'DT0002.jpg', '판매 중',
        '마리오 카트 8 디럭스', '마리오카드입니다.', 5);

-- 게임기 / 게임 타이틀
INSERT INTO tb_game (gm_code, gm_name, gm_level, gm_category, gm_price, gm_img)
values ('DT0001', '마리오＋래비드 킹덤 배틀', '전체이용가', '어드벤처, 시뮬레이션', 50000, '001.jpg');

INSERT INTO tb_game (gm_code, gm_name, gm_level, gm_category, gm_price, gm_img)
values ('MN0001', '닌텐도 스위치', '전체이용가', '본체', 100000, '002.jpg');

INSERT INTO tb_game (gm_code, gm_name, gm_level, gm_category, gm_price, gm_img)
values ('AC0001', 'SWITCH Joy-Con(L/R) 네온레드/네온블루', '전체이용가', '조이콘', 80000, '003.jpg');

INSERT INTO tb_game (gm_code, gm_name, gm_level, gm_category, gm_price, gm_img)
values ('PT0001', '젤다의 전설 브레스 오브 더 와일드', '12세 이용가', '액션, 어드벤처', 250000, '004.jpg')
     , ('DT0002', '마리오 카트 8 디럭스', '전체이용가', '액션, 레이싱', 75000, '005.jpg');

-- 포토 리뷰
INSERT INTO tb_review (mem_id, rv_content, rv_star, rv_filename, ss_num)
values ('gjdjj888', '이건 아니다', 10, 'not.jpg', 5);

INSERT INTO tb_review (mem_id, rv_content, rv_star, rv_filename, ss_num)
values ('oejdf9090', '이 세상의 것이 아니다', 5, 'real.jpg', 6);

insert into tb_review (mem_id, rv_content, rv_star, rv_filename, ss_num)
values ('fjhdmj555', '한때의 꿈', 6, 'dream.jpg', 7);

-- 1:1 문의
insert into tb_question (mem_id, qs_content, qs_date, qs_category)
values ('gjdjj888', '배송 언제 될까요?', '2022-01-01 00:00:00', '배송')
     , ('oejdf9090', '고장 났어요~', '2022-12-05 12:00:00', '상품')
     , ('fjhdmj555', '교환 가능할까요?', '2022-11-11 14:00:00', '기타');

-- 문의 답변
insert into tb_answer (qs_num, ans_content, ans_date)
values (1, '내일 됩니다. 떽!', '2022-01-01 12:00:00')
     , (2, '새로 바꿔드리겠습니다.', '2022-12-05 13:00:00')
     , (3, '가능합니다.', '2022-11-11 14:00:00');


-- 김주완
-- 장바구니
INSERT INTO tb_basket(ss_num, bk_amount, mem_id)
VALUES(1, 12, 'oejdf9090');

INSERT into tb_basket(ss_num, bk_amount, mem_id)
VALUES(2, 5, 'gjdjj888');

INSERT into tb_basket(ss_num, bk_amount, mem_id)
VALUES(2, 4, 'fjhdmj555');


-- 주문서
INSERT INTO tb_order(od_num, od_date, mem_id, dv_num, mem_dvnum, cp_code, umileage, pmileage, total)
VALUES('202211021003-002', now(), 'gjdjj888', 1, 1, 'A0000', 0, 3600, 360000);

INSERT INTO tb_order(od_num, od_date, mem_id, dv_num, mem_dvnum, cp_code, umileage, pmileage, total)
VALUES('202211231620-001', now(), 'oejdf9090', 2, 3, 'A0002', 1500, 798, 78300);

INSERT INTO tb_order(od_num, od_date, mem_id, dv_num, mem_dvnum, cp_code, umileage, pmileage, total)
VALUES('202211021003-001', now(), 'gjdjj888', 3, 2, 'A0001', 1000, 3600, 359000);

INSERT INTO tb_order(od_num, od_date, mem_id, dv_num, mem_dvnum, cp_code, umileage, pmileage, total)
VALUES('202210010903-001', now(), 'fjhdmj555', 4, 1, 'A0000', 0, 648, 64800);


-- 주문상세보기
INSERT INTO tb_detail(od_num, dv_num, dt_prog, dt_odstts, dt_refund, ss_num, dt_paymnt, dt_msg)
VALUES('202211021003-002', 1, '교환', '교환', 'Y', 1, '신용카드','문 앞에 예쁘게 놔주세요');

INSERT INTO tb_detail(od_num, dv_num, dt_prog, dt_odstts, dt_refund, ss_num, dt_paymnt, dt_msg)
VALUES('202211231620-001', 2, '배송완료', '없음', 'Y', 1, '무통장','');

INSERT INTO tb_detail(od_num, dv_num, dt_prog, dt_odstts, dt_refund, ss_num, dt_paymnt, dt_msg)
VALUES('202211021003-001', 3, '반품', '반품', 'Y', 1, '신용카드','문 앞에 예쁘게 놔주세요');

INSERT INTO tb_detail(od_num, dv_num, dt_prog, dt_odstts, dt_refund, ss_num, dt_paymnt, dt_msg)
VALUES('202210010903-001', 4, '구매확정', '없음', 'N', 1, '카카오페이','안전하게 보내주세요 박스 망가지면 환불요청함');


-- 교환반품
insert into tb_er (dt_num, er_cause, er_img, er_email)
values(2, '사이즈 미스', 'size_miss.png', 'itwill@naver.com')

insert into tb_er (dt_num, er_cause, er_img, er_email)
values(4, '안 예쁨', 'not_pretty.png', 'jinsang@gmail.com')


-- 쿠폰
INSERT into tb_coupon(cp_code, cp_name, cp_speriod, cp_eperiod, cp_percent)
VALUES('A0000', '쿠폰 사용 안함', now(), '99991231', 0);

INSERT into tb_coupon(cp_code, cp_name, cp_speriod, cp_eperiod, cp_percent)
VALUES('A0001', '생일 쿠폰', now(), '20330914', 10);

INSERT into tb_coupon(cp_code, cp_name, cp_speriod, cp_eperiod, cp_percent)
VALUES('A0002', '회원가입 축하 쿠폰', now(), '20230223', 5);

INSERT into tb_coupon(cp_code, cp_name, cp_speriod, cp_eperiod, cp_percent)
VALUES('B0001', '핫딜 쿠폰 ', now(), '20221223', 10);

INSERT into tb_coupon(cp_code, cp_name, cp_speriod, cp_eperiod, cp_percent)
VALUES('B0002', '블.프 쿠폰', now(), '20221201', 15);

-- 쿠폰 리스트
insert into tb_couponlist (cp_code, mem_id)
values('B0002', 'oejdf9090');

insert into tb_couponlist (cp_code, mem_id)
values('B0001', 'gjdjj888');

insert into tb_couponlist (cp_code, mem_id)
values('A0002', 'fjhdmj555');

insert into tb_couponlist (cp_code, mem_id)
values('A0001', 'fjhdmj555');

-- 김홍승
-- 판매자
INSERT INTO tb_seller (sl_id, sl_pw, sl_name, sl_zip, sl_adr1, sl_adr2, sl_phone, sl_birth, sl_grade, sl_receive, sl_number, sl_bank, sl_bankcode)
VALUES ('ekdm1234', '1234', '닌텐돌', '09876', '경기도 성남시 분당구 정자일로', '95', '031-1111-2222', '19801002', 'SVIP', 'Y', '123-12-12345', '110-36-2345-474', 4)
     ,('pogjj777', '1234', '닝텐도', '54321', '서울특별시 강남구 테헤란로', '124 4층', '02-5566-3344', '19900428', 'SGOLD', 'Y', '392-48-38727', '396-4804-9385-11', 11)
     ,('digj1908', '1234', '닌텡도', '76543', '경기도 성남시 분당구 판교역로241번길', '20', '010-9977-4567', '19750530', 'SGOLD', 'N', '698-29-28744', '3454-334-583492', 88)
     ,('itwill', '1234', '닝텡동', '43210', '강원도 양구군 남면 삼팔선로', '112', '010-0101-2222', '19990202', 'SSILVER', 'Y', '123-16-45645', '110-462-057303', 4)
     ,('codingking', '1234', '링딩동', '06547', '경기도 평택시 세교3로 8', '102-702', '010-0225-1475', '19950626', 'SGREEN', 'N', '456-45-78978', '110-568-159456', 4);


-- 회원
INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_email, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad)
VALUES ('gjdjj888', '1234', '방이동도도민경', '김민경', '12345', '서울특별시 중구 세종대로', '67', '02-6466-4564', 'kimjoowan@naver.com', '19980224', 'VIP', 5000, 5000, 'N', 0, 0);

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_email, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad)
VALUES ('oejdf9090', '1234', '장지동십만우', '구천우', '34567', '서울특별시 서초구 서초대로78길', '5 대각빌딩', '010-4363-5464', 'kimjoowan@naver.com', '19951103', 'GOLD', 2500, 12500, 'N', 0, 0);

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_email, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad)
VALUES ('fjhdmj555', '1234', '정릉동핵주먹', '최다은', '12345', '서울특별시 서대문구 통일로', '97', '010-4893-7777', 'kimjoowan@naver.com', '19880520', 'SILVER', 3000, 3000, 'Y', 0, 0);

-- 배송정책
INSERT INTO tb_delivery (sl_id, dv_exist, dv_how, dv_courier, dv_fee, dv_extrafee, dv_adr1, dv_adr2, dv_rffee, dv_exfee, dv_exadr1, dv_exadr2)
VALUES ('ekdm1234', 'Y', '택배', '로젠', 2500, 0, '경기도 성남시 분당구 정자일로', '95', 2500, 5000, '경기도 성남시 분당구 정자일로', '95')
     ,('pogjj777', 'N', '화물', '대신화물', 4400, 0, '서울특별시 강남구 테헤란로', '124 4층', 4000, 4000, '서울특별시 강남구 테헤란로', '124 4층')
     ,('digj1908', 'N', '화물', '철수화물', 4400, 0, '경기도 성남시 분당구 판교역로241번길', '20', 4000, 4000, '경기도 성남시 분당구 판교역로241번길', '20')
     ,('itwill', 'Y', '택배', 'CJ대한', 2500, 0, '강원도 양구군 남면 삼팔선로', '112', 2500, 5000, '강원도 양구군 남면 삼팔선로', '112')
      ,('codingking', 'Y', '택배', 'CJ대한', 2500, 3000, '제주특별자치도 제주시 첨단로', '242', 2500, 5000, '제주특별자치도 제주시 첨단로', '242');


-- 회원 배송지 정보
INSERT INTO tb_memdv (mem_id, mem_dvinfo, mem_dvzip, mem_dvadr1, mem_dvadr2, mem_dvphone, mem_dvnick)
VALUES ('gjdjj888', '김민경', '12345', '서울특별시 중구 세종대로', '67', '02-6466-4564', '친구집')
     ,('oejdf9090', '구천우', '34567', '서울특별시 서초구 서초대로78길', '5 대각빌딩', '010-4363-5464', '아이티윌')
     ,('fjhdmj555', '김주완', '25746', '서울특별시 서대문구 통일로', '97', '010-4893-7777', '집')
     ,('fjhdmj555', '김주완', '53342', '경기도 평택시 세교3로 8', '205-102', '010-1234-5678', '회사');


-- 위시리스트
INSERT INTO tb_wish (mem_id, ss_num)
VALUES ('gjdjj888', 5)
     ,('oejdf9090', 5)
     ,('fjhdmj555', 6)
     ,('fjhdmj555', 7)
     ,('fjhdmj555', 8);


-- 회원평가
/*INSERT INTO tb_evaluation (mem_id, eval_content, eval_regdate)
VALUES ('oejdf9090', '불친절해요', '20221001')
     ,('oejdf9090', '게임 이해도가 낮아요', '20221002')
     ,('oejdf9090', '급발진을 잘해요', '20221003')
     ,('oejdf9090', '진행병이 있어요', '20221004')
     ,('oejdf9090', '얼굴개그를 쳐요', '20221005')
     ,('gjdjj888', '술 마시고 왔어요', '20221101')
     ,('fjhdmj555', '약속시간을 잘 지켜요', '20221101')
     ,('fjhdmj555', '매너가 좋아요', '20221102')
     ,('fjhdmj555', '상대방 말을 너무 끊어요', '20221103')
     ,('gjdjj888', '억지가 너무 심해요', '20221104');*/


-- 공지사항
INSERT INTO tb_nt (nt_title, nt_cmt, nt_regdate, nt_views)
VALUES ('[공지] 닌텐도 다운로드(디지털) 상품, ★★★[지금 다운로드] 이용 안내 ★★★', '※다운로드가 진행되지 않는 경우에는 본체를 슬립으로 하거나 소프트웨어를 종료해 주십시오.', '20210224', 826741)
     ,('[공지] 소프라노를 알차게 이용하는 회원 기본 혜택 안내', '소프라노 회원님께만 드리는 다양한 기본 혜택을 안내드립니다', '20191021', 869291)
     ,('[공지] PlayStation VR2 11월 추첨 판매 공지', '상품의 추첨 판매를 진행하여 아래와 같이 공지 드립니다.', '20221114', 5369);


-- 최다은
-- 이벤트게시판
INSERT INTO tb_evt(evt_title, evt_start, evt_end, evt_views, evt_desc, evt_regdate)
values ('닌텐도 2022 추석 세일', '20220101', '20220130', 40451, '252m.jpg', '20221123')
     ,('추석 맞이 넨텐도 Switch 다운로드 스토어 10% 할인![종료]', '20220205', '20220305', 39000, '250m.jpg', '20221124')
     ,('닌텐도 6월 프로모션![종료]', '20211207', '20211231', 72376, '243m.jpg', '20221125');


-- 이벤트 신청자
INSERT INTO tb_evtapl(evt_num, mem_id, evtapl_date)
VALUES (1, 'gjdjj888', '20220108')
     ,(2, 'oejdf9090', '20220315')
     ,(3, 'fjhdmj555', '20221220');


-- 모집게시판
INSERT INTO tb_rcrboard(mem_id, rcrbrd_subject, rcrbrd_content, rcrbrd_pw, rcrbrd_views, rcrbrd_date, rcrbrd_edate, rcrbrd_ip, gm_code, rcrbrd_status, rcrbrd_adr, rcrbrd_max)
VALUES ('gjdjj888', '잠실 핵주먹을 찾습니다', '핵주먹 뭐하냐', '1234', 2, '20221121', '20221221140000', '192.195.14.23', 'AC0001', '마감', '서울', 5)
     ,('oejdf9090', '아직...한발 남았다', '도망쳐', '1234', 3, '20221121', '20221222150000', '192.195.14.97', 'DT0001', '진행중', '부산', 10)
     ,('fjhdmj555', '너만오면시작', '토니 김홍승', '1234', 4, '20221121', '20221221110000', '192.195.14.77', 'DT0002', '마감', '제주', 7)
     ,('fjhdmj555', '쉽지 않다 인생', '스타크 김홍승', '1234', 21, '20221121', '20221221090000', '192.195.14.36', 'MN0001', '진행중', '서울', 5);


-- 모집정보
INSERT INTO tb_recruitinfo(mem_id, rcrbrd_num, ri_seat)
VALUES ('oejdf9090', 10, 1)
     ,('gjdjj888', 13, 1)
     ,('fjhdmj555', 15, 1)
     ,('fjhdmj555', 17, 1)
     ,('fjhdmj555', 19, 1)
     ,('oejdf9090', 20, 1);


-- 모집댓글
INSERT INTO tb_comment(rcrbrd_num, mem_id, com_content, com_date, com_grpno, com_indent, com_ansnum)
VALUES (1, 'oejdf9090', '당신이 아이티윌의 김두한입니까', '20221121', 1, 0, 1)
     ,(2, 'gjdjj888', '홍승형 놀리지 마요', '20221121', 1, 1, 2)
     ,(3, 'fjhdmj555', '저 왜요ㅡㅡ', '20221121', 1, 2, 3)
     ,(4, 'oejdf9090', 'ㅋㅋㅋㅋㅋ너무 웃겨요', '20221121', 1, 3, 4)
     ,(3, 'fjhdmj555', 'ㄴㅇㄱ', '20221121', 2, 0, 5)
     ,(1, 'gjdjj888', '갈비찜을 밥 위에 올려주세요', '20221121', 3, 0, 6);

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_email, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad, mem_pic, mem_joindate)
VALUES ('gjdjj888', '1234', '방이동도도민경', '김민경', '12345', '서울특별시 중구 세종대로', '67', '02-6466-4564', 'kimminkyeong@naver.com', '19980224', 'SILVER', 5000, 5000, 'N', 0, 0, 'pic.jpg', now());

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_email, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad, mem_pic, mem_joindate)
VALUES ('oejdf9090', '1234', '장지동십만우', '구천우', '34567', '서울특별시 서초구 서초대로78길', '5 대각빌딩', '010-4363-5464', 'kimjoowan@naver.com', '19951103', 'GOLD', 2500, 12500, 'N', 0, 0, 'pic2.jpg', now());

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_email, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad, mem_pic, mem_joindate)
VALUES ('fjhdmj555', '1234', '정릉동핵주먹', '최다은', '12345', '서울특별시 서대문구 통일로', '97', '010-4893-7777', 'kimjoowan@naver.com', '19880520', 'SILVER', 3000, 3000, 'Y', 0, 0,  'pic3.jpg', now());