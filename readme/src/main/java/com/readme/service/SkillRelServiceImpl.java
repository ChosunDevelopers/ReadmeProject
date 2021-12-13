package com.readme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.SkillRelDAO;
import com.readme.dto.SkillRelVO;

@Service
public class SkillRelServiceImpl implements SkillRelService {

	@Inject
	private SkillRelDAO dao;
	
	@Override
	public List<SkillRelVO> listSkillRel() throws Exception {
		
		return dao.listSkillRel();
	}

	@Override
	public List<SkillRelVO> getSkillList(String skill) {
		// TODO Auto-generated method stub
		return dao.getSkillList(skill);
	}

	@Override
	public List<SkillRelVO> getSkillListForName(String name) {
		// TODO Auto-generated method stub
		return dao.getSkillListForName(name);
	}

	@Override
	public String getUserSkillList(String id) {
		// TODO Auto-generated method stub
		return dao.getUserSkillList(id);
	}

}
