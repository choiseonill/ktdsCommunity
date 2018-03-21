package com.ktdsProject.member.service;

import com.ktdsProject.member.dao.MemberDao;
import com.ktdsProject.member.service.MemberService;
import com.ktdsProject.member.vo.MemberVO;


public class MemberServiceImpl implements MemberService{

	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public boolean createMember(MemberVO memberVO) {
		return memberDao.insertMember(memberVO) > 0;
	}

	@Override
	public MemberVO readMember(MemberVO memberVO) {
		return memberDao.selectMember(memberVO);
	}

	

}
