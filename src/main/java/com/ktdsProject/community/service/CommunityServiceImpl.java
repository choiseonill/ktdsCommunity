package com.ktdsProject.community.service;

import java.util.List;

import com.ktdsProject.community.dao.CommunityDAO;
import com.ktdsProject.community.vo.CommunityVO;

public class CommunityServiceImpl implements CommunityService{

	private CommunityDAO communityDAO;
	
	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}
	
	@Override
	public List<CommunityVO> getAll() {
		return communityDAO.selectAll();
	}

	@Override
	public boolean createCommunity(CommunityVO communityVO) {
		int insertCount = communityDAO.insertCommunity(communityVO);
		return insertCount >= 1;
	}

	@Override
	public CommunityVO detailCommunity(int titleNO) {
		CommunityVO communityVO = communityDAO.readCommunity(titleNO);
		return communityVO;
	}

	@Override
	public boolean removeCommunity(int titleNo) {
		int removeVO = communityDAO.deleteCommunity(titleNo);
		return removeVO >= 1;
	}

	@Override
	public boolean viewCountCommunity(int titleNo) {
		int view = communityDAO.updateViewCountCommunity(titleNo);
		return view >= 1;
	}

	@Override
	public boolean likeCountCommunity(int titleNo) {
		int like = communityDAO.updateLikeCountCommunity(titleNo);
		return like >= 1;
	}

}
