package com.verest.board.test;


public class Test {
	public static void main(String[] args) {
		String s = "https://www.youtube.com/watch?v=WXybWlcE2JE";
		String address = s.replace("watch?v=", "embed/");
		System.out.println(address);
	}
}

