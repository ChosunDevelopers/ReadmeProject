package com.readme.dao;

import java.util.List;

import com.readme.dto.MemberVO;

public interface MemberDAO {

	public List<MemberVO> selectMember() throws Exception;

}
