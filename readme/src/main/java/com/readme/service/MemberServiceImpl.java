package com.readme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.readme.dao.MemberDAO;
import com.readme.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

    @Inject
    private MemberDAO dao;
    
    @Override
    public List<MemberVO> selectMember() throws Exception {
 
        return dao.selectMember();
    }



}
