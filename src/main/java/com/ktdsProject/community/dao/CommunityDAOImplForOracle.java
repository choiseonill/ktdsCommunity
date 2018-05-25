package com.ktdsProject.community.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ktdsProject.community.vo.CommunitySearchVO;
import com.ktdsProject.community.vo.CommunityVO;

public class CommunityDAOImplForOracle extends SqlSessionDaoSupport implements CommunityDAO{

	@Override
	public List<CommunityVO> selectAll(CommunitySearchVO communitySearchVO) {
		return getSqlSession().selectList("CommunityDAO.selectAll", communitySearchVO);
	}

	@Override
	public int insertCommunity(CommunityVO communityVO) {
		return getSqlSession().insert("CommunityDAO.insertCommunity", communityVO);
	}

	@Override
	public CommunityVO readCommunity(int communityId) {
		return getSqlSession().selectOne("CommunityDAO.readCommunity", communityId);
	}

	@Override
	public int deleteCommunity(int communityId) {	
		return getSqlSession().delete("CommunityDAO.deleteCommunity", communityId);
	}

	@Override
	public int updateViewCountCommunity(int communityId) {
		return getSqlSession().update("CommunityDAO.updateViewCountCommunity", communityId);
	}

	@Override
	public int updateLikeCountCommunity(int communityId) {
		return getSqlSession().update("CommunityDAO.updateLikeCountCommunity", communityId);
	}

	@Override
	public int updateCommunity(CommunityVO communityVO) {
		return getSqlSession().update("CommunityDAO.updateCommunity", communityVO );
	}

	@Override
	public int selectCountAll(CommunitySearchVO communitySearchVO) {
		return getSqlSession().selectOne("CommunityDAO.selectCountAll",communitySearchVO);
	}

	

}
