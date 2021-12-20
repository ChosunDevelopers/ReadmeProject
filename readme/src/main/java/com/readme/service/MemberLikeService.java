package com.readme.service;

import java.util.HashMap;

public interface MemberLikeService {

	public int memberLikeCheck(HashMap<String, Object> hm);

	public int nowDislike(HashMap<String, Object> hm);

	public int nowLike(HashMap<String, Object> hm);
	
}
