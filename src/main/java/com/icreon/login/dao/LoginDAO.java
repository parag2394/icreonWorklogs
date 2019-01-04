package com.icreon.login.dao;

import java.util.List;

public interface LoginDAO {
	
	public List authenticate_user(String username,String password);
	public int validateUser_withJIRA(String username, String password);

}
