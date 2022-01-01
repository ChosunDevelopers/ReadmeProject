package com.readme.dao;

import java.util.List;

import com.readme.dto.MemberProfileVO;
import com.readme.dto.SkillRelVO;

public interface SkillRelDAO {

	public List<SkillRelVO> listSkillRel() throws Exception;

	public List<MemberProfileVO> getSkillList(String skill);

	public List<MemberProfileVO> getSkillListForName(String name);

	public String getUserSkillList(String id);
	
}
