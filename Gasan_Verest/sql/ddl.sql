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
	v_id NUMBER NOT NULL,
	v_email VARCHAR2(320) NOT NULL,
	v_password VARCHAR2(60) NOT NULL,
	v_name VARCHAR2(20) NOT NULL,
	v_regdate DATE NOT NULL,
	CONSTRAINT pk_userinfo PRIMARY KEY (v_id),
	CONSTRAINT uk_userinfo UNIQUE (v_email)
);

CREATE SEQUENCE userinfo_seq
START WITH 1 INCREMENT BY 1;

CREATE TABLE usertype (
	v_id NUMBER NOT NULL,
	v_type VARCHAR2(30) NOT NULL,
	CONSTRAINT pk_user_type PRIMARY KEY (v_id)
);

CREATE SEQUENCE usertype_seq
START WITH 1 INCREMENT BY 1;

CREATE TABLE userinfotype (
	user_info_id NUMBER NOT NULL,
	user_type_id NUMBER NOT NULL,
	CONSTRAINT fk_userinfo FOREIGN KEY (user_info_id) REFERENCES userinfo (v_id),
	CONSTRAINT fk_usertype FOREIGN KEY (user_type_id) REFERENCES usertype (v_id)
);

-- 판매 게시판
CREATE TABLE sale (
   no NUMBER NOT NULL,
   title  VARCHAR2(100) NOT NULL,
   content 	VARCHAR2(4000),
   writer	 NUMBER NOT NULL,
   price NUMBER NOT NULL,
   regdate  DATE NOT NULL,
   attachment	VARCHAR2(255),
   attachmentImg	VARCHAR2(255),
   views NUMBER NOT NULL,
   CONSTRAINT pk_sale PRIMARY KEY (no),
   CONSTRAINT fk_sale_writer FOREIGN KEY (writer) REFERENCES userinfo(v_id)
);

CREATE SEQUENCE sale_seq
START WITH 1 INCREMENT BY 1;

-- 포토폴리오 게시판
CREATE TABLE port (
   no NUMBER NOT NULL,
   title  VARCHAR2(100) NOT NULL,
   content 	VARCHAR2(4000),
   writer	 NUMBER NOT NULL,
   regdate  DATE NOT NULL,
   attachment	VARCHAR2(255),
   attachmentImg	VARCHAR2(255),
   views NUMBER NOT NULL,
   p_type VARCHAR2(50) NOT NULL,
   CONSTRAINT pk_port PRIMARY KEY (no),
   CONSTRAINT fk_port_writer FOREIGN KEY (writer) REFERENCES userinfo(v_id)
);

CREATE SEQUENCE port_seq
START WITH 1 INCREMENT BY 1;

-- 프로젝트 게시판
CREATE TABLE project (
   no NUMBER NOT NULL,
   title  VARCHAR2(100) NOT NULL,
   content 	VARCHAR2(4000),
   writer	 NUMBER NOT NULL,
   regdate  DATE NOT NULL,
   attachment	VARCHAR2(255),
   attachmentImg	VARCHAR2(255),
   views NUMBER NOT NULL,
   CONSTRAINT pk_project PRIMARY KEY (no),
   CONSTRAINT fk_project_writer FOREIGN KEY (writer) REFERENCES userinfo(v_id)
);

CREATE SEQUENCE project_seq
START WITH 1 INCREMENT BY 1;

-- 주문확인 게시판
CREATE TABLE order_list(
	or_no NUMBER NOT NULL, -- 주문번호
	v_id NUMBER NOT NULL, -- 사용자 번호
	sale_no NUMBER NOT NULL, -- 게시물 번호
	regdate DATE NOT NULL, -- 구매일
	state VARCHAR2(20) NOT NULL,
	CONSTRAINT pk_order_list PRIMARY KEY (or_no),
	CONSTRAINT fk_order_list_id FOREIGN KEY (v_id) REFERENCES userinfo (v_id),
	CONSTRAINT fk_order_list_no FOREIGN KEY (sale_no) REFERENCES sale (no)
);
CREATE SEQUENCE order_list_seq
START WITH 1 INCREMENT BY 1;

-- 장바구니 게시판
CREATE TABLE basket(
	basket_no NUMBER NOT NULL, -- 장바구니 번호
	v_id NUMBER NOT NULL, -- 사용자 번호
	sale_no NUMBER NOT NULL, -- 게시물 번호
	regdate DATE NOT NULL, 
	CONSTRAINT pk_basket PRIMARY KEY (basket_no),
	CONSTRAINT fk_basket_id FOREIGN KEY (v_id) REFERENCES userinfo (v_id),
	CONSTRAINT fk_basket_no FOREIGN KEY (sale_no) REFERENCES sale (no)
);
CREATE SEQUENCE basket_seq
START WITH 1 INCREMENT BY 1;

-- 문의 게시판
CREATE TABLE question(
	qu_no NUMBER NOT NULL, -- 문의 번호
	writer NUMBER NOT NULL, -- 작성자
	content VARCHAR2(2000), -- 내용
	title VARCHAR2(100) NOT NULL, -- 제목
	regdate DATE NOT NULL, -- 작성일
	CONSTRAINT pk_question PRIMARY KEY (qu_no),
	CONSTRAINT fk_question_id FOREIGN KEY (writer) REFERENCES userinfo (v_id)
);
CREATE SEQUENCE question_seq
START WITH 1 INCREMENT BY 1;

-- 후기 게시판
CREATE TABLE backsight(
	back_no NUMBER NOT NULL, -- 후기 번호
	writer NUMBER NOT NULL, -- 작성자
	content VARCHAR2(500), -- 내용
	title VARCHAR2(100) NOT NULL, -- 제목
	b_like NUMBER NOT NULL,
	regdate DATE NOT NULL, -- 작성일
	CONSTRAINT pk_backsight PRIMARY KEY (back_no),
	CONSTRAINT fk_backsight_id FOREIGN KEY (writer) REFERENCES userinfo (v_id)
);
CREATE SEQUENCE backsight_seq
START WITH 1 INCREMENT BY 1;