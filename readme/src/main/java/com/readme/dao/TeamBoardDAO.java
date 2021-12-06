package com.readme.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("com.readme.mapper.teamMapper.insertboard",map);
	}
	
	public int update(Map<String, Object> map) {  
		return this.sqlSessionTemplate.update("com.readme.mapper.teamMapper.update_board", map);  
	}  
	public Map<String, Object> selectBoard(Map<String, Object> map) {
	    return this.sqlSessionTemplate.selectOne("com.readme.mapper.teamMapper.select_board", map);
	}
	
	public int delete(Map<String, Object> map) {  
		return this.sqlSessionTemplate.delete("com.readme.mapper.teamMapper.delete_board", map);  
	}  
	
	public List<Map<String, Object>> selectList(Map<String, Object> map) {  
		return this.sqlSessionTemplate.selectList("com.readme.mapper.teamMapper.select_list", map);  
	}  
	
}
