package com.readme.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.MemberLikeDAO;

@Service
public class MemberLikeServiceImpl implements MemberLikeService {

	@Inject
	private MemberLikeDAO dao;


	@Override
	public int memberLikeCheck(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return dao.memberLikeCheck(hm);
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
