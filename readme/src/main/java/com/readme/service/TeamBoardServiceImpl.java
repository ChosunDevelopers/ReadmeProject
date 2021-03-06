package com.readme.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.readme.controller.TeamBoardController;
import com.readme.dao.TeamBoardDAO;

@Service
public class TeamBoardServiceImpl implements TeamBoardService {

	@Autowired
	TeamBoardDAO teamBoardDAO; 
	

    private static final Logger logger = LoggerFactory.getLogger(TeamBoardServiceImpl.class);
	@Override
	public String create(Map<String, Object> map) {
		int affectRowCount = this.teamBoardDAO.insert(map);
		if(affectRowCount == 1) {
			return map.get("teamBoard_bno").toString();
		}
		
		return null;
	}
	
	
	@Override  
	public boolean edit(Map<String, Object> map) {  
		int affectRowCount = this.teamBoardDAO.update(map);
		return affectRowCount == 1;  

	}  
	
	@Override
	public Map<String, Object> board_detail(Map<String, Object> map){
	    return this.teamBoardDAO.selectBoard(map);
	}
	
	@Override  
	public boolean remove(Map<String, Object> map) {  
		int affectRowCount = this.teamBoardDAO.delete(map);  
		return affectRowCount == 1;  
	}  
	@Override  
	public List<Map<String, Object>> list(Map<String, Object> map){  
		return this.teamBoardDAO.selectList(map);
	}  
	
}
