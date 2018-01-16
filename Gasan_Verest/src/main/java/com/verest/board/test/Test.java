package com.verest.board.test;

import com.verest.board.dao.UserInfoDaoImpl;
import com.verest.board.model.UserInfo;

public class Test {
	public static void main(String[] args) {
		UserInfoDaoImpl dao = new UserInfoDaoImpl();
		UserInfo data = dao.select(1);
		System.out.println(data.getV_email());
		System.out.println(data.getV_password());
	}
}

