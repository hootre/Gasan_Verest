-- test		

		SELECT b.back_no, b.writer, b.content, b.title, to_char(b.regdate, 'yyyy-mm-dd hh:mi') as "REGDATE", u.v_email, u.v_name
		FROM userinfo u, backsight b
		WHERE b.writer = u.v_id  ORDER BY b.back_no DESC;
		
		SELECT u.v_id as "UID", u.v_email, u.v_password, u.v_name, to_char(u.v_regdate, 'yyyy-mm-dd hh:mi') as "REGDATE",ut.v_id, ut.v_type
		FROM userinfo u,
			(SELECT userinfotype.user_info_id, usertype.v_id, usertype.v_type
			FROM userinfotype, usertype
			WHERE usertype.v_id = userinfotype.user_type_id) ut
		WHERE u.v_id = ut.user_info_id;

-- 회원관련 
SELECT * FROM userinfo;
SELECT * FROM usertype;
SELECT * FROM userinfotype;

SELECT userinfotype.user_info_id, usertype.v_id, usertype.v_type
FROM userinfotype, usertype
WHERE usertype.v_id = userinfotype.user_type_id;

SELECT u.v_id, u.v_email, u.v_password, u.v_name, ut.v_id, ut.v_type
FROM userinfo u,
	(SELECT userinfotype.user_info_id, usertype.v_id, usertype.v_type
	FROM userinfotype, usertype
	WHERE usertype.v_id = userinfotype.user_type_id) ut
WHERE u.v_id = ut.user_info_id ;

-- 회원 이메일로 검색
SELECT u.v_id, u.v_email, u.v_password, u.v_name, ut.v_id, ut.v_type
FROM userinfo u,
	(SELECT userinfotype.user_info_id, usertype.v_id, usertype.v_type
	FROM userinfotype, usertype
	WHERE usertype.v_id = userinfotype.user_type_id) ut
WHERE u.v_id = ut.user_info_id AND u.v_email = 'hootre@naver.com';

SELECT u.v_id as "UID", u.v_email, u.v_password, u.v_name, ut.v_id, ut.v_type
FROM userinfo u,
	(SELECT userinfotype.user_info_id, usertype.v_id, usertype.v_type
	FROM userinfotype, usertype
	WHERE usertype.v_id = userinfotype.user_type_id) ut
WHERE u.v_id = ut.user_info_id;


SELECT u.v_id as "UID", u.v_email, u.v_password, u.v_name, ut.v_id, ut.v_type
FROM userinfo u,
	(SELECT userinfotype.user_info_id, usertype.v_id, usertype.v_type
	FROM userinfotype, usertype
	WHERE usertype.v_id = userinfotype.user_type_id) ut
WHERE u.v_id = ut.user_info_id AND u.v_id = 1;

select * from userinfo where userinfo.v_id = 1;

-- update 양식
UPDATE sale 
SET title = '수정수정', content = 'asdasd', price = 30000, regdate = SYSDATE
WHERE no = 1;

-- DELETE 양식
DELETE FROM sale WHERE no = 1;
-- 게시판 관련

-- sale 전체 개수
SELECT COUNT(*) FROM sale;
select * from sale;
-- sale 게시판 상세보기
SELECT s.no, s.title, s.content, u.v_id as "writer", s.price, s.attachment, s.views   
FROM sale s, userinfo u
WHERE s.writer = u.v_id; --AND s.no = ### (한개만 검색할때)
-- sale_dat 전체 개수
SELECT COUNT(*) FROM sale_dat; 
-- sale_dat 게시판 상세보기
SELECT sd.dat_no, s.no as "BOARD_NO", u.v_id as "writer", sd.content, sd.regdate
FROM sale_dat sd, userinfo u, sale s
WHERE sd.board_no = s.no AND sd.writer = u.v_id; --AND sd.dat_no = ### (한개만 검색할때)

-- port 전체 개수
SELECT COUNT(*) FROM port;
UPDATE port 
SET  views = 2
WHERE no = 1;

SELECT p.no, p.title, p.content, p.writer, to_char(p.regdate, 'yyyy-mm-dd hh:mi') as "REGDATE", p.attachment, p.views, u.v_id, u.v_name
FROM userinfo u, port p
WHERE p.writer = u.v_id ORDER BY p.no DESC;

-- port 게시판 상세보기
SELECT p.no, p.title, p.content, p.writer, to_char(p.regdate, 'yyyy/mm/dd hh:mi'), p.attachment, p.views, u.v_id, u.v_name
FROM userinfo u, port p
WHERE p.writer = u.v_id; --AND p.no = ### (한개만 검색할때)
-- port_dat 전체 개수
SELECT COUNT(*) FROM port_dat;
-- port_dat 게시판 상세보기
SELECT pd.dat_no, p.no as "BOARD_NO", u.v_id as "writer", pd.content, pd.regdate
FROM port_dat pd, userinfo u, port p 
WHERE pd.board_no = p.no AND pd.writer = u.v_id; --AND pd.dat_no = ### (한개만 검색할때)

-- project 전체 개수
SELECT COUNT(*) FROM project;
-- project 게시판 상세보기
SELECT pj.no, pj.title, pj.content, u.v_id as "writer", pj.attachment, pj.views   
FROM project pj, userinfo u
WHERE pj.writer = u.v_id; --AND pj.no = ### (한개만 검색할때)
-- project_dat 전체 개수
SELECT COUNT(*) FROM port_dat;
-- project_dat 게시판 상세보기
SELECT pjd.dat_no, pj.no as "BOARD_NO", u.v_id as "writer", pjd.content, pjd.regdate
FROM project_dat pjd, userinfo u, project pj
WHERE pjd.board_no = pj.no AND pjd.writer = u.v_id; --AND pjd.dat_no = ### (한개만 검색할때)

SELECT * FROM ORDER_STATE;

-- order_list 전체 개수
SELECT COUNT(*) FROM order_list;
-- order_list 주문확인 상세보기
SELECT ol.or_no, u.v_id as "V_ID", s.no as "SALE_NO",s.title as "SALE_NAME", ol.regdate 
FROM order_list ol, userinfo u, sale s
WHERE ol.v_id = u.v_id AND ol.sale_no = s.no; --AND ol.or_no = ### (한개만 검색할때)

-- basket 장바구니 전체 개수
SELECT COUNT(*) FROM basket;
-- basket 장바구니 상세보기
SELECT b.basket_no, u.v_id, s.no as "sale_no" 
FROM basket b, userinfo u, sale s
WHERE b.v_id = u.v_id AND b.sale_no = s.no; --AND b.basket_no = ### (한개만 검색할때)

-- question 문의 전체 개수
SELECT COUNT(*) FROM question;
-- question 문의 상세보기
SELECT q.qu_no, u.v_id as "writer", q.content, q.title, q.regdate
FROM question q, userinfo u
WHERE q.writer = u.v_id; --AND q.qu_no = ### (한개만 검색할때)

-- backsight 후기 전체 개수
SELECT COUNT(*) FROM backsight;
-- backsight 후기 상세보기
SELECT bs.back_no, u.v_id as "writer", bs.content, bs.title, bs.regdate
FROM backsight bs, userinfo u
WHERE bs.writer = u.v_id; --AND bs.back_no = ### (한개만 검색할때)


