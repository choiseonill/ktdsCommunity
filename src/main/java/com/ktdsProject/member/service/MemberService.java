package com.ktdsProject.member.service;

import com.ktdsProject.member.vo.MemberVO;

public interface MemberService {

	public boolean createMember(MemberVO memberVO);
	
	public MemberVO readMember(MemberVO memberVO);
}
