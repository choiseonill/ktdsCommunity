package com.ktdsProject.member.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktdsProject.member.dao.MemberDao;
import com.ktdsProject.member.vo.MemberVO;

public class MemberDaoImplForOracle extends SqlSessionDaoSupport implements MemberDao {

	@Override
	public int insertMember(MemberVO memberVO) {
		
		return getSqlSession().insert("MemberDao.insertMember",memberVO);
	}

	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		
		return getSqlSession().selectOne("MemberDao.selectMember",memberVO);
	}

}
