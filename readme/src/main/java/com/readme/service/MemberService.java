package com.readme.service;

import java.util.List;


import com.readme.dto.MemberVO;

public interface MemberService {

	public List<MemberVO> selectMember() throws Exception;
	
	public int insertMember(MemberVO memberVO);
	
	public MemberVO loginMember(MemberVO memberVO);
	
	public int memberUpdate(MemberVO memberVO);
	
	
	
}
