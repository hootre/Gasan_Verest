package com.verest.board.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Test {
	public static void main(String[] args) throws UnsupportedEncodingException {
	/*	String password = "1346156z";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encoding = encoder.encode(password);
		System.out.println(encoding);*/
		
	       String email = "test16131d13f12.jpg", id,domain;
	        int i = email.indexOf("."); 
	        // 변수 email이 포함하고있는 @ 의 인덱스 값을 변수 i 에 대입.
	        
	        id = email.substring(0, i);
	        String rid = id.substring(id.length()-11, id.length());
	        id = id.replaceAll(rid, " ");
	        // 변수 email의 0번째인덱스부터 i번째 인덱스까지 추출하여 변수 id 에 대입.
	        domain = email.substring(i+1);
	        // 변수 email의 i+1번째 인덱스부터 추출하여 변수 domain 에 대입.
	        
	        System.out.println("아이디: "+id+"도메인: "+domain);
	        // 아이디: test 도메인: domain.com 

	}
}

