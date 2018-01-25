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
		
		String name = URLEncoder.encode("나대지마 권순우", "UTF-8");
		System.out.println(name);
		String oname = URLDecoder.decode(name);
		System.out.println(oname);
	}
}

