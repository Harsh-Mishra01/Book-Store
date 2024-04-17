package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDao {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getCartDtls(int uid);
	
	public boolean removeBook(int bid, int uid, int cid);

}
