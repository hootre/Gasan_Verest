<<<<<<< HEAD
=======
INSERT INTO usertype(v_id, v_type)
VALUES (usertype_seq.NEXTVAL, 'ADMIN');

INSERT INTO usertype(v_id, v_type)
VALUES (usertype_seq.NEXTVAL, 'USER');

INSERT INTO userinfo(v_id, v_email, v_password, v_name)
VALUES (userinfo_seq.NEXTVAL, 'admin@koitt.com', 
'$2a$10$b.Epv/t3IKT8v7oh4Byx8.1G7WszQRm42a6Nvbpne0o4BsA/4sUOi',
'전동준');

INSERT INTO userinfotype(user_info_id, user_type_id)
VALUES ('admin@koitt.com', 1);

INSERT INTO userinfotype(user_info_id, user_type_id)
VALUES ('admin@koitt.com', 2);

INSERT INTO project(no, title, content, writer, regdate, attachment, views)
VALUES (project_seq.NEXTVAL, '첫글', '부레', '관리자', SYSDATE, NULL, 0);

INSERT INTO port(no, title, content, writer, regdate, attachment, views)
VALUES (port_seq.NEXTVAL, '첫글', '부레', '관리자', SYSDATE, NULL, 0);

INSERT INTO sale(no, title, content, writer, price, regdate, attachment, views)
VALUES (sale_seq.NEXTVAL, '첫글', '부레', '관리자', 500000 , SYSDATE, NULL, 0);

INSERT INTO sale_dat(dat_no, board_no, writer, content, regdate)
VALUES (sale_dat_seq.NEXTVAL, 1, '작성자', '콘텐트', SYSDATE);

INSERT INTO port_dat(dat_no, board_no, writer, content, regdate)
VALUES (port_dat_seq.NEXTVAL, 1, '작성자', '콘텐트', SYSDATE);

INSERT INTO sale_dat(dat_no, board_no, writer, content, regdate)
VALUES (project_dat_seq.NEXTVAL, 1, '작성자', '콘텐트', SYSDATE);

INSERT INTO question1(qu_no, writer, content, title, regdate)
VALUES (question1_seq.NEXTVAL, '작성자', '콘텐트', '제목', SYSDATE);

INSERT INTO basket (basket_no, v_id, sale_no)
VALUES (basket_no_seq.NEXTVAL, 1, 1);

INSERT INTO order_list (or_no, v_id, sale_no, regdate)
VALUES (order_list_seq.NEXTVAL, 1, 1, SYSDATE);

