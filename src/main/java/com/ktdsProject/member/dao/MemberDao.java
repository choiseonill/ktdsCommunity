package com.ktdsProject.member.dao;

import com.ktdsProject.member.vo.MemberVO;

public interface MemberDao {

	// 회원가입
	public int insertMember(MemberVO memberVO);
	
	// 로그인
	public MemberVO selectMember(MemberVO memberVO);
	
	// 암호화
	public String selectSalt(String email);
	
	// 회원가입 이메일 중복검사
	public int selectCheckMemberEmail(String email);
	
	// 회원가입 닉네임 중복검사
	public int selectCheckMemberNickname(String nickname);
	
	
	
}