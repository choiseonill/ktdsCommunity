package com.ktdsProject.member.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktdsProject.member.dao.MemberDao;
import com.ktdsProject.member.vo.MemberVO;

public class MemberDaoImplForOracle extends SqlSessionDaoSupport implements MemberDao {

	// 회원가입
	@Override
	public int insertMember(MemberVO memberVO) {
		
		return getSqlSession().insert("MemberDao.insertMember",memberVO);
	}

	// 로그인
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		
		return getSqlSession().selectOne("MemberDao.selectMember",memberVO);
	}

	// 암호화
	@Override
	public String selectSalt(String email) {
		return getSqlSession().selectOne("MemberDao.selectSalt",email);
	}

	// 회원가입 이메일 중복검사
	@Override
	public int selectCheckMemberEmail(String email) {
		return getSqlSession().selectOne("MemberDao.selectCheckMemberEmail",email);
	}

	// 회원가입 닉네임 중복검사
	@Override
	public int selectCheckMemberNickname(String nickname) {
		return getSqlSession().selectOne("MemberDao.selectCheckMemberNickname", nickname);
	}

	

	
}
