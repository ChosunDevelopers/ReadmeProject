package com.readme.dao;

import java.util.HashMap;

public interface MemberLikeDAO {

	public int memberLikeCheck(HashMap<String, Object> hm);

	public int nowDislike(HashMap<String, Object> hm);

	public int nowLike(HashMap<String, Object> hm);
	
}
