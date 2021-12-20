package com.readme.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.TeamBoardLikeDAO;



@Service
public class TeamBoardLikeServiceImpl implements TeamBoardLikeService {

	@Inject
	private TeamBoardLikeDAO dao;
	
	
	@Override
	public int boardLikeCheck(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return dao.boardLikeCheck(hm);
	}


	@Override
	public int nowDislike(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return dao.nowDislike(hm);
	}


	@Override
	public int nowLike(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return dao.nowLike(hm);
	}

}
