package com.ktdsProject.member.dao;

import com.ktdsProject.member.vo.MemberVO;

public interface MemberDao {

	public int insertMember(MemberVO memberVO);
	
	public MemberVO selectMember(MemberVO memberVO);
}
