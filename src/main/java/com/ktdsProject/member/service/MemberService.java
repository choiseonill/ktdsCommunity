package com.ktdsProject.member.service;

import com.ktdsProject.member.vo.MemberVO;

public interface MemberService {

	//회원가입
	public boolean createMember(MemberVO memberVO);
	
	//로그인
	public MemberVO readMember(MemberVO memberVO);
	
	// 회원가입 이메일 중복검사
	public boolean readCheckMemberEmail(String email);
	
	// 회원가입 닉네임 중복검사
	public boolean readCheckMemberNickname(String nickname);
	
	
	
	
}
