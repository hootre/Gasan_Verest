INSERT INTO usertype(v_id, v_type)
VALUES (usertype_seq.NEXTVAL, 'ADMIN');

INSERT INTO usertype(v_id, v_type)
VALUES (usertype_seq.NEXTVAL, 'USER');

INSERT INTO userinfo(v_id, v_email, v_password, v_name, v_regdate)
VALUES (userinfo_seq.NEXTVAL, 'hootre@nate.com', 
'$2a$10$5UUYVdv8u4ktDRwR5SCLGuRHfEnGGUMdvQn4iJsB14N8tQk2oi97u',
'전동준', SYSDATE);

INSERT INTO userinfo(v_id, v_email, v_password, v_name,  v_regdate)
VALUES (userinfo_seq.NEXTVAL, 'koo@naver.com', 
'$2a$10$X62xKKmwFnKiyaL9bm5uv.A0mE4ivbZpiVC9.69Tq/6gKy0sf/PBa',
'권순우', SYSDATE);

DELETE FROM userinfotype WHERE user_type_id = 2;
INSERT INTO userinfotype(user_info_id, user_type_id)
VALUES (1, 1);

INSERT INTO userinfotype(user_info_id, user_type_id)
VALUES (1, 2);

INSERT INTO userinfotype(user_info_id, user_type_id)
VALUES (2, 2);

INSERT INTO project(no, title, content, writer, regdate, attachment, attachmentImg, views)
VALUES (project_seq.NEXTVAL, '첫글', '부레', 1, SYSDATE, 'https://www.youtube.com/embed/X0dHG-jcTDo', null, 0);

INSERT INTO port(no, title, content, writer, regdate, attachment, attachmentImg, views)
VALUES (port_seq.NEXTVAL, '첫글', '부레', 1, SYSDATE, 'https://www.youtube.com/embed/X0dHG-jcTDo', null, 0);

INSERT INTO sale(no, title, content, writer, price, regdate, attachment, attachmentImg, views)
VALUES (sale_seq.NEXTVAL, '빵빵', '부레', 2, 500000 , SYSDATE, 'https://www.youtube.com/embed/X0dHG-jcTDo', null, 0);

INSERT INTO question(qu_no, writer, content, title, regdate)
VALUES (question_seq.NEXTVAL, 1, '콘텐트', '제목', SYSDATE);

INSERT INTO backsight(back_no, writer, content, title,b_like, regdate)
VALUES (backsight_seq.NEXTVAL, 1, '콘텐트', '제목', 5, SYSDATE);

INSERT INTO basket (basket_no, v_id, sale_no, regdate)
VALUES (basket_seq.NEXTVAL, 1, 1, SYSDATE);

INSERT INTO order_list (or_no, v_id, sale_no, regdate, state)
VALUES (order_list_seq.NEXTVAL, 1, 1, SYSDATE, '미입금');

