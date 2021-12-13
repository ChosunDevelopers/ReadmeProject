package com.readme.service;

import java.util.List;

import com.readme.dto.SkillRelVO;

public interface SkillRelService {

	public List<SkillRelVO> listSkillRel() throws Exception;

	public List<SkillRelVO> getSkillList(String skill);

	public List<SkillRelVO> getSkillListForName(String name);

	public String getUserSkillList(String id);
}
