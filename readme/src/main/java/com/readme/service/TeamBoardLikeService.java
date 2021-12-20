package com.readme.service;

import java.util.HashMap;

public interface TeamBoardLikeService {

	int boardLikeCheck(HashMap<String, Object> hm);

	int nowDislike(HashMap<String, Object> hm);

	int nowLike(HashMap<String, Object> hm);

}
