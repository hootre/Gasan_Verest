package com.verest.board.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Test {
	public static void main(String[] args) {
		String password = "1346156z";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encoding = encoder.encode(password);
		System.out.println(encoding);
	}
}
