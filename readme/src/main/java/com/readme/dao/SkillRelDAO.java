package com.readme.dao;

import java.util.List;

import com.readme.dto.SkillRelVO;

public interface SkillRelDAO {

	public List<SkillRelVO> listSkillRel() throws Exception;

	public List<SkillRelVO> getSkillList(String skill);

	public List<SkillRelVO> getSkillListForName(String name);

	public String getUserSkillList(String id);
	
}
