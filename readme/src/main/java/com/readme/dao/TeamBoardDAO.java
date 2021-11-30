package com.readme.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("com.readme.mapper.memberMapper.insertboard",map);
	}
	
	public int update(Map<String, Object> map) {  
		return this.sqlSessionTemplate.update("com.readme.mapper.memberMapper.update_board", map);  
	}  
	public Map<String, Object> selectBoard(Map<String, Object> map) {
	    return this.sqlSessionTemplate.selectOne("com.readme.mapper.memberMapper.select_board", map);
	}
	
	public int delete(Map<String, Object> map) {  
		return this.sqlSessionTemplate.delete("com.readme.mapper.memberMapper.delete_board", map);  
	}  
	
}
