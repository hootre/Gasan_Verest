DROP TABLE userinfotype;
DROP TABLE usertype;
DROP SEQUENCE usertype_seq;
DROP TABLE basket;
DROP SEQUENCE basket_seq;
DROP TABLE order_list;
DROP SEQUENCE order_list_seq;
DROP TABLE question;
DROP SEQUENCE question_seq;
DROP TABLE backsight;
DROP SEQUENCE backsight_seq;
DROP TABLE sale;
DROP SEQUENCE sale_seq;
DROP TABLE port;
DROP SEQUENCE port_seq;
DROP TABLE project;
DROP SEQUENCE project_seq;
DROP TABLE userinfo;
DROP SEQUENCE userinfo_seq;


-- 강제삭제 DROP TABLE userinfo CASCADE CONSTRAINTS PURGE;
CREATE TABLE userinfo(
	v_id INT NOT NULL AUTO_INCREMENT,
	v_email VARCHAR(320) NOT NULL,
	v_password VARCHAR(60) NOT NULL,
	v_name VARCHAR(20) NOT NULL,
	v_regdate DATETIME NOT NULL,
	CONSTRAINT pk_userinfo PRIMARY KEY (v_id),
	CONSTRAINT uk_userinfo UNIQUE (v_email)
);

CREATE TABLE usertype (
	v_id INT NOT NULL AUTO_INCREMENT,
	v_type VARCHAR2(30) NOT NULL,
	CONSTRAINT pk_usertype PRIMARY KEY (v_id)
);

CREATE TABLE userinfotype (
	user_info_id INT NOT NULL,
	user_type_id INT NOT NULL,
	CONSTRAINT fk_userinfo FOREIGN KEY (user_info_id) REFERENCES userinfo (v_id),
	CONSTRAINT fk_usertype FOREIGN KEY (user_type_id) REFERENCES usertype (v_id)
);

-- 판매 게시판
CREATE TABLE sale (
   no INT NOT NULL AUTO_INCREMENT,
   title  VARCHAR(100) NOT NULL,
   content VARCHAR(4000),
   writer INT NOT NULL,
   price INT NOT NULL,
   regdate  DATETIME NOT NULL,
   attachment	VARCHAR(255),
   attachmentImg	VARCHAR(255),
   views INT NOT NULL,
   CONSTRAINT pk_sale PRIMARY KEY (no),
   CONSTRAINT fk_sale_writer FOREIGN KEY (writer) REFERENCES userinfo(v_id)
);


-- 포토폴리오 게시판
CREATE TABLE port (
   no INT NOT NULL AUTO_INCREMENT,
   title  VARCHAR(100) NOT NULL,
   content VARCHAR(4000),
   writer INT NOT NULL,
   regdate  DATETIME NOT NULL,
   attachment VARCHAR(255),
   attachmentImg VARCHAR(255),
   views INT NOT NULL,
   p_type VARCHAR(100) NOT NULL,
   CONSTRAINT pk_port PRIMARY KEY (no),
   CONSTRAINT fk_port_writer FOREIGN KEY (writer) REFERENCES userinfo(v_id)
);

-- 프로젝트 게시판
CREATE TABLE project (
   no INT NOT NULL AUTO_INCREMENT,
   title  VARCHAR(100) NOT NULL,
   content VARCHAR(4000),
   writer INT NOT NULL,
   regdate  DATETIME NOT NULL,
   attachment	VARCHAR(255),
   attachmentImg VARCHAR(255),
   views INT NOT NULL,
   CONSTRAINT pk_project PRIMARY KEY (no),
   CONSTRAINT fk_project_writer FOREIGN KEY (writer) REFERENCES userinfo(v_id)
);

-- 주문확인 게시판
CREATE TABLE order_list(
	or_no INT NOT NULL AUTO_INCREMENT, -- 주문번호
	v_id INT NOT NULL, -- 사용자 번호
	sale_no INT NOT NULL, -- 게시물 번호
	regdate DATETIME NOT NULL, -- 구매일
	state VARCHAR(20) NOT NULL,
	CONSTRAINT pk_order_list PRIMARY KEY (or_no),
	CONSTRAINT fk_order_list_id FOREIGN KEY (v_id) REFERENCES userinfo (v_id),
	CONSTRAINT fk_order_list_no FOREIGN KEY (sale_no) REFERENCES sale (NO)
);

-- 장바구니 게시판
CREATE TABLE basket(
	basket_no INT NOT NULL AUTO_INCREMENT, -- 장바구니 번호
	v_id INT NOT NULL, -- 사용자 번호
	sale_no INT NOT NULL, -- 게시물 번호
	regdate DATETIME NOT NULL, 
	CONSTRAINT pk_basket PRIMARY KEY (basket_no),
	CONSTRAINT fk_basket_id FOREIGN KEY (v_id) REFERENCES userinfo (v_id),
	CONSTRAINT fk_basket_no FOREIGN KEY (sale_no) REFERENCES sale (NO)
);

-- 문의 게시판
CREATE TABLE question(
	qu_no INT NOT NULL AUTO_INCREMENT, -- 문의 번호
	writer INT NOT NULL, -- 작성자
	content VARCHAR(2000), -- 내용
	title VARCHAR(100) NOT NULL, -- 제목
	regdate DATETIME NOT NULL, -- 작성일
	CONSTRAINT pk_question PRIMARY KEY (qu_no),
	CONSTRAINT fk_question_id FOREIGN KEY (writer) REFERENCES userinfo (v_id)
);

-- 후기 게시판
CREATE TABLE backsight(
	back_no INT NOT NULL AUTO_INCREMENT, -- 후기 번호
	writer INT NOT NULL, -- 작성자
	content VARCHAR(500), -- 내용
	title VARCHAR(100) NOT NULL, -- 제목
	b_like INT NOT NULL,
	regdate DATETIME NOT NULL, -- 작성일
	CONSTRAINT pk_backsight PRIMARY KEY (back_no),
	CONSTRAINT fk_backsight_id FOREIGN KEY (writer) REFERENCES userinfo (v_id)
);