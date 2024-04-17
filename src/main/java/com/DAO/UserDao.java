package com.DAO;

import com.entity.User;

public interface UserDao {
	public boolean userRegister(User us);
	public abstract User userLogin (String email,String password);

}
