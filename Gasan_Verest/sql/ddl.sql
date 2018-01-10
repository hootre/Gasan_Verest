-- 사용자
CREATE TABLE userinfo (
	v_id       NUMBER       NOT NULL, -- 번호
	v_email    VARCHAR(320) NOT NULL, -- 이메일
	v_password VARCHAR(20)  NOT NULL, -- 비밀번호
	v_name     VARCHAR(20)  NOT NULL, -- 이름
);

-- 사용자 기본키
CREATE UNIQUE INDEX PK_userinfo
	ON userinfo ( -- 사용자
		v_id ASC -- 번호
	);

-- 사용자 유니크 인덱스
CREATE UNIQUE INDEX UIX_userinfo
	ON userinfo ( -- 사용자
		v_email ASC -- 이메일
	);

-- 사용자
ALTER TABLE userinfo
	ADD
		CONSTRAINT PK_userinfo -- 사용자 기본키
		PRIMARY KEY (
			v_id -- 번호
		);

-- 사용자
ALTER TABLE userinfo
	ADD
		CONSTRAINT UK_userinfo -- 사용자 유니크 제약
		UNIQUE (
			v_email -- 이메일
		);

-- 사용자 타입
CREATE TABLE usertype (
	v_id   NUMBER      NOT NULL, -- 번호
	v_type VARCHAR(30) NOT NULL  -- 타입
);

-- 사용자 타입 기본키
CREATE UNIQUE INDEX PK_usertype
	ON usertype ( -- 사용자 타입
		v_id ASC -- 번호
	);

-- 사용자 타입
ALTER TABLE usertype
	ADD
		CONSTRAINT PK_usertype -- 사용자 타입 기본키
		PRIMARY KEY (
			v_id -- 번호
		);

-- 유저타입인포
CREATE TABLE usertypeinfo (
	user_info_id NUMBER NOT NULL, -- 유저
	user_type_id NUMBER NULL      -- 타입
);

-- 프로젝트 게시판
CREATE TABLE project (
	no         NUMBER         NOT NULL, -- 게시물 번호
	title      VARCHAR2(100)  NOT NULL, -- 제목
	content    VARCHAR2(4000) NULL,     -- 내용
	writer     NUMBER         NOT NULL, -- 작성자
	regdate    DATE           NOT NULL, -- 작성일
	attachment VARCHAR2(255)  NULL,     -- 첨부파일
	views      NUMBER         NOT NULL  -- 조회수
);

-- 프로젝트 게시판 기본키
CREATE UNIQUE INDEX PK_project
	ON project ( -- 프로젝트 게시판
		no ASC -- 게시물 번호
	);

-- 프로젝트 게시판
ALTER TABLE project
	ADD
		CONSTRAINT PK_project -- 프로젝트 게시판 기본키
		PRIMARY KEY (
			no -- 게시물 번호
		);

-- 포트폴리오 게시판
CREATE TABLE port (
	no         NUMBER         NOT NULL, -- 게시물 번호
	title      VARCHAR2(100)  NOT NULL, -- 제목
	content    VARCHAR2(4000) NULL,     -- 내용
	writer     NUMBER         NOT NULL, -- 작성자
	regdate    DATE           NOT NULL, -- 작성일
	attachment VARCHAR2(255)  NULL,     -- 첨부파일
	views      NUMBER         NOT NULL  -- 조회수
);

-- 포트폴리오 게시판 기본키
CREATE UNIQUE INDEX PK_port
	ON port ( -- 포트폴리오 게시판
		no ASC -- 게시물 번호
	);

-- 포트폴리오 게시판
ALTER TABLE port
	ADD
		CONSTRAINT PK_port -- 포트폴리오 게시판 기본키
		PRIMARY KEY (
			no -- 게시물 번호
		);

-- 판매 게시판
CREATE TABLE sale (
	no         NUMBER         NOT NULL, -- 게시물 번호
	title      VARCHAR2(100)  NOT NULL, -- 제목
	content    VARCHAR2(4000) NULL,     -- 내용
	writer     NUMBER         NOT NULL, -- 작성자
	price      NUMBER         NOT NULL, -- 가격
	regdate    DATE           NOT NULL, -- 작성일
	attachment VARCHAR2(255)  NULL,     -- 첨부파일
	views      NUMBER         NOT NULL  -- 조회수
);

-- 판매 게시판 기본키
CREATE UNIQUE INDEX PK_sale
	ON sale ( -- 판매 게시판
		no ASC -- 게시물 번호
	);

-- 판매 게시판
ALTER TABLE sale
	ADD
		CONSTRAINT PK_sale -- 판매 게시판 기본키
		PRIMARY KEY (
			no -- 게시물 번호
		);

-- 판매 게시판 댓글
CREATE TABLE sale_dat (
	dat_no     NUMBER         NOT NULL, -- 댓글 번호
	board_no   NUMBER         NOT NULL, -- 게시물 번호
	dat_writer NUMBER         NOT NULL, -- 작성자
	content    VARCHAR2(2000) NULL,     -- 내용
	regdate    DATE           NOT NULL  -- 작성일
);

-- 판매 게시판 댓글 기본키
CREATE UNIQUE INDEX PK_sale_dat
	ON sale_dat ( -- 판매 게시판 댓글
		dat_no ASC -- 댓글 번호
	);

-- 판매 게시판 댓글
ALTER TABLE sale_dat
	ADD
		CONSTRAINT PK_sale_dat -- 판매 게시판 댓글 기본키
		PRIMARY KEY (
			dat_no -- 댓글 번호
		);

-- 포트폴리오 게시판 댓글
CREATE TABLE port_dat (
	dat_no     NUMBER         NOT NULL, -- 댓글 번호
	board_no   NUMBER         NOT NULL, -- 게시물 번호
	dat_writer NUMBER         NOT NULL, -- 작성자
	content    VARCHAR2(2000) NULL,     -- 내용
	regdate    DATE           NOT NULL  -- 작성일
);

-- 포트폴리오 게시판 댓글 기본키
CREATE UNIQUE INDEX PK_port_dat
	ON port_dat ( -- 포트폴리오 게시판 댓글
		dat_no ASC -- 댓글 번호
	);

-- 포트폴리오 게시판 댓글
ALTER TABLE port_dat
	ADD
		CONSTRAINT PK_port_dat -- 포트폴리오 게시판 댓글 기본키
		PRIMARY KEY (
			dat_no -- 댓글 번호
		);

-- 프로젝트 게시판 댓글
CREATE TABLE project_dat (
	dat_no     NUMBER         NOT NULL, -- 댓글 번호
	board_no   NUMBER         NOT NULL, -- 게시물 번호
	dat_writer NUMBER         NOT NULL, -- 작성자
	content    VARCHAR2(2000) NULL,     -- 내용
	regdate    DATE           NOT NULL  -- 작성일
);

-- 프로젝트 게시판 댓글 기본키
CREATE UNIQUE INDEX PK_project_dat
	ON project_dat ( -- 프로젝트 게시판 댓글
		dat_no ASC -- 댓글 번호
	);

-- 프로젝트 게시판 댓글
ALTER TABLE project_dat
	ADD
		CONSTRAINT PK_project_dat -- 프로젝트 게시판 댓글 기본키
		PRIMARY KEY (
			dat_no -- 댓글 번호
		);

-- 후기
CREATE TABLE backsight (
	back_no NUMBER        NOT NULL, -- 후기 번호
	writer  NUMBER        NOT NULL, -- 작성자
	content VARCHAR(2000) NULL,     -- 내용
	title   VARCHAR(100)  NOT NULL, -- 제목
	regdate DATE          NOT NULL  -- 작성일
);

-- 후기 기본키
CREATE UNIQUE INDEX PK_backsight
	ON backsight ( -- 후기
		back_no ASC -- 후기 번호
	);

-- 후기
ALTER TABLE backsight
	ADD
		CONSTRAINT PK_backsight -- 후기 기본키
		PRIMARY KEY (
			back_no -- 후기 번호
		);

-- 문의
CREATE TABLE question1 (
	qu_no   NUMBER        NOT NULL, -- 후기 번호
	writer  NUMBER        NOT NULL, -- 작성자
	content VARCHAR(2000) NULL,     -- 내용
	title   VARCHAR(100)  NOT NULL, -- 제목
	regdate DATE          NOT NULL  -- 작성일
);

-- 문의 기본키
CREATE UNIQUE INDEX PK_question1
	ON question1 ( -- 문의
		qu_no ASC -- 후기 번호
	);

-- 문의
ALTER TABLE question1
	ADD
		CONSTRAINT PK_question1 -- 문의 기본키
		PRIMARY KEY (
			qu_no -- 후기 번호
		);

-- 마이페이지
CREATE TABLE mypage (
	user_info_id NUMBER NOT NULL -- 유저 번호
);

-- 마이페이지 기본키
CREATE UNIQUE INDEX PK_mypage
	ON mypage ( -- 마이페이지
		user_info_id ASC -- 유저 번호
	);

-- 마이페이지
ALTER TABLE mypage
	ADD
		CONSTRAINT PK_mypage -- 마이페이지 기본키
		PRIMARY KEY (
			user_info_id -- 유저 번호
		);

-- 장바구니
CREATE TABLE basket (
	basket_no NUMBER NOT NULL, -- 장바구니 번호
	v_id      NUMBER NOT NULL, -- 사용자 번호
	sale_no   NUMBER NOT NULL  -- 게시물 번호
);

-- 장바구니 기본키
CREATE UNIQUE INDEX PK_basket
	ON basket ( -- 장바구니
		basket_no ASC -- 장바구니 번호
	);

-- 장바구니
ALTER TABLE basket
	ADD
		CONSTRAINT PK_basket -- 장바구니 기본키
		PRIMARY KEY (
			basket_no -- 장바구니 번호
		);

-- 주문확인
CREATE TABLE order_list (
	or_no   NUMBER NOT NULL, -- 주문번호
	v_id    NUMBER NOT NULL, -- 사용자번호
	sale_no NUMBER NOT NULL, -- 게시물 번호
	regdate DATE   NOT NULL  -- 구매일
);

-- 주문확인 기본키
CREATE UNIQUE INDEX PK_order_list
	ON order_list ( -- 주문확인
		or_no ASC -- 주문번호
	);

-- 주문확인
ALTER TABLE order_list
	ADD
		CONSTRAINT PK_order_list -- 주문확인 기본키
		PRIMARY KEY (
			or_no -- 주문번호
		);

-- 유저타입인포
ALTER TABLE usertypeinfo
	ADD
		CONSTRAINT FK_userinfo_TO_usertypeinfo -- 사용자 -> 유저타입인포
		FOREIGN KEY (
			user_info_id -- 유저
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 유저타입인포
ALTER TABLE usertypeinfo
	ADD
		CONSTRAINT FK_usertype_TO_usertypeinfo -- 사용자 타입 -> 유저타입인포
		FOREIGN KEY (
			user_type_id -- 타입
		)
		REFERENCES usertype ( -- 사용자 타입
			v_id -- 번호
		);

-- 프로젝트 게시판
ALTER TABLE project
	ADD
		CONSTRAINT FK_userinfo_TO_project -- 사용자 -> 프로젝트 게시판
		FOREIGN KEY (
			writer -- 작성자
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 포트폴리오 게시판
ALTER TABLE port
	ADD
		CONSTRAINT FK_userinfo_TO_port -- 사용자 -> 포트폴리오 게시판
		FOREIGN KEY (
			writer -- 작성자
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 판매 게시판
ALTER TABLE sale
	ADD
		CONSTRAINT FK_userinfo_TO_sale -- 사용자 -> 판매 게시판
		FOREIGN KEY (
			writer -- 작성자
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 판매 게시판 댓글
ALTER TABLE sale_dat
	ADD
		CONSTRAINT FK_sale_TO_sale_dat -- 판매 게시판 -> 판매 게시판 댓글
		FOREIGN KEY (
			board_no -- 게시물 번호
		)
		REFERENCES sale ( -- 판매 게시판
			no -- 게시물 번호
		);

-- 판매 게시판 댓글
ALTER TABLE sale_dat
	ADD
		CONSTRAINT FK_userinfo_TO_sale_dat -- 사용자 -> 판매 게시판 댓글
		FOREIGN KEY (
			dat_writer -- 작성자
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 포트폴리오 게시판 댓글
ALTER TABLE port_dat
	ADD
		CONSTRAINT FK_userinfo_TO_port_dat -- 사용자 -> 포트폴리오 게시판 댓글
		FOREIGN KEY (
			dat_writer -- 작성자
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 포트폴리오 게시판 댓글
ALTER TABLE port_dat
	ADD
		CONSTRAINT FK_port_TO_port_dat -- 포트폴리오 게시판 -> 포트폴리오 게시판 댓글
		FOREIGN KEY (
			board_no -- 게시물 번호
		)
		REFERENCES port ( -- 포트폴리오 게시판
			no -- 게시물 번호
		);

-- 프로젝트 게시판 댓글
ALTER TABLE project_dat
	ADD
		CONSTRAINT FK_userinfo_TO_project_dat -- 사용자 -> 프로젝트 게시판 댓글
		FOREIGN KEY (
			dat_writer -- 작성자
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 프로젝트 게시판 댓글
ALTER TABLE project_dat
	ADD
		CONSTRAINT FK_project_TO_project_dat -- 프로젝트 게시판 -> 프로젝트 게시판 댓글
		FOREIGN KEY (
			board_no -- 게시물 번호
		)
		REFERENCES project ( -- 프로젝트 게시판
			no -- 게시물 번호
		);

-- 후기
ALTER TABLE backsight
	ADD
		CONSTRAINT FK_userinfo_TO_backsight -- 사용자 -> 후기
		FOREIGN KEY (
			writer -- 작성자
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 문의
ALTER TABLE question1
	ADD
		CONSTRAINT FK_userinfo_TO_question1 -- 사용자 -> 문의
		FOREIGN KEY (
			writer -- 작성자
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 마이페이지
ALTER TABLE mypage
	ADD
		CONSTRAINT FK_userinfo_TO_mypage -- 사용자 -> 마이페이지
		FOREIGN KEY (
			user_info_id -- 유저 번호
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 장바구니
ALTER TABLE basket
	ADD
		CONSTRAINT FK_userinfo_TO_basket -- 사용자 -> 장바구니
		FOREIGN KEY (
			v_id -- 사용자 번호
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 장바구니
ALTER TABLE basket
	ADD
		CONSTRAINT FK_sale_TO_basket -- 판매 게시판 -> 장바구니
		FOREIGN KEY (
			sale_no -- 게시물 번호
		)
		REFERENCES sale ( -- 판매 게시판
			no -- 게시물 번호
		);

-- 주문확인
ALTER TABLE order_list
	ADD
		CONSTRAINT FK_userinfo_TO_order_list -- 사용자 -> 주문확인
		FOREIGN KEY (
			v_id -- 사용자번호
		)
		REFERENCES userinfo ( -- 사용자
			v_id -- 번호
		);

-- 주문확인
ALTER TABLE order_list
	ADD
		CONSTRAINT FK_sale_TO_order_list -- 판매 게시판 -> 주문확인
		FOREIGN KEY (
			sale_no -- 게시물 번호
		)
		REFERENCES sale ( -- 판매 게시판
			no -- 게시물 번호
		);