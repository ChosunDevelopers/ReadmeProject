package com.readme.service;

import java.util.List;
import java.util.Map;

public interface TeamBoardService {

	String create(Map<String, Object> map);


	Map<String, Object> board_detail(Map<String, Object> map);


	boolean edit(Map<String, Object> map);


	boolean remove(Map<String, Object> map);


	List<Map<String, Object>> list(Map<String, Object> map);



}
