package com.readme.dao;

import java.util.HashMap;

public interface TeamBoardLikeDAO {

	int boardLikeCheck(HashMap<String, Object> hm);

	int nowDislike(HashMap<String, Object> hm);

	int nowLike(HashMap<String, Object> hm);

}
