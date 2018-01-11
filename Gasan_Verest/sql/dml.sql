INSERT INTO usertype(v_id, v_type)
VALUES (usertype_seq.NEXTVAL, 'ADMIN');

INSERT INTO usertype(v_id, v_type)
VALUES (usertype_seq.NEXTVAL, 'USER');

INSERT INTO userinfo(v_id, v_email, v_password, v_name)
VALUES (userinfo_seq.NEXTVAL, 'hootre@naver.com', 
'$2a$10$nzVjrSL9pWYHOTVHKupv0emeZUNebVvTCmUgoHsy8A4aJov6G44TS',
'전동준');

INSERT INTO userinfo(v_id, v_email, v_password, v_name)
VALUES (userinfo_seq.NEXTVAL, 'koo@naver.com', 
'$2a$10$X62xKKmwFnKiyaL9bm5uv.A0mE4ivbZpiVC9.69Tq/6gKy0sf/PBa',
'권순우');


INSERT INTO userinfotype(user_info_id, user_type_id)
VALUES (1, 1);

INSERT INTO userinfotype(user_info_id, user_type_id)
VALUES (1, 2);

INSERT INTO project(no, title, content, writer, regdate, attachment, views)
VALUES (project_seq.NEXTVAL, '첫글', '부레', 1, SYSDATE, NULL, 0);

INSERT INTO port(no, title, content, writer, regdate, attachment, views)
VALUES (port_seq.NEXTVAL, '첫글', '부레', 1, SYSDATE, NULL, 0);

INSERT INTO sale(no, title, content, writer, price, regdate, attachment, views)
VALUES (sale_seq.NEXTVAL, '세글', '부레', 2, 500000 , SYSDATE, NULL, 0);

select * from sale_dat;
INSERT INTO sale_dat(dat_no, board_no, writer, content, regdate)
VALUES (sale_dat_seq.NEXTVAL, 1, 1, '콘텐트', SYSDATE);

INSERT INTO port_dat(dat_no, board_no, writer, content, regdate)
VALUES (port_dat_seq.NEXTVAL, 1, 1, '콘텐트', SYSDATE);

INSERT INTO project_dat(dat_no, board_no, writer, content, regdate)
VALUES (project_dat_seq.NEXTVAL, 1, 1, '콘텐트', SYSDATE);

INSERT INTO question(qu_no, writer, content, title, regdate)
VALUES (question_seq.NEXTVAL, 1, '콘텐트', '제목', SYSDATE);

INSERT INTO backsight(back_no, writer, content, title, regdate)
VALUES (backsight_seq.NEXTVAL, 1, '콘텐트', '제목', SYSDATE);

INSERT INTO basket (basket_no, v_id, sale_no)
VALUES (basket_seq.NEXTVAL, 1, 1);

INSERT INTO order_list (or_no, v_id, sale_no, regdate)
VALUES (order_list_seq.NEXTVAL, 1, 1, SYSDATE);

