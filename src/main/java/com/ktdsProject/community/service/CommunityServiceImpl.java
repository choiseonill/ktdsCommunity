package com.ktdsProject.community.service;

import com.ktdsProject.community.dao.CommunityDAO;
import com.ktdsProject.community.vo.CommunitySearchVO;
import com.ktdsProject.community.vo.CommunityVO;
import com.ktdsProject.webPager.Pager;
import com.ktdsProject.webPager.PagerFactory;
import com.ktdsProject.webPager.explorer.ClassicPageExplorer;
import com.ktdsProject.webPager.explorer.PageExplorer;

public class CommunityServiceImpl implements CommunityService{

	private CommunityDAO communityDAO;
	
	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}
	
	@Override
	public PageExplorer getAll(CommunitySearchVO communitySearchVO) {
		Pager pager = PagerFactory.getPager(Pager.ORACLE,
											communitySearchVO.getPageNo() + "",
											communityDAO.selectCountAll(communitySearchVO));

		PageExplorer pageExplorer = pager.makePageExplorer(ClassicPageExplorer.class, communitySearchVO);
		System.out.println(communitySearchVO.getEndNumber());
		System.out.println(communitySearchVO.getStartNumber());
		
		pageExplorer.setList(communityDAO.selectAll(communitySearchVO));
		
		return pageExplorer;
	}

	@Override
	public boolean createCommunity(CommunityVO communityVO) {
		int insertCount = communityDAO.insertCommunity(communityVO);
		return insertCount >= 1;
	}

	@Override
	public CommunityVO detailCommunity(int communityId) {
		CommunityVO communityVO = communityDAO.readCommunity(communityId);
		return communityVO;
	}

	@Override
	public boolean removeCommunity(int communityId) {
		int removeVO = communityDAO.deleteCommunity(communityId);
		return removeVO > 0;
	}

	@Override
	public boolean viewCountCommunity(int communityId) {
		int view = communityDAO.updateViewCountCommunity(communityId);
		return view > 0;
	}

	@Override
	public boolean likeCountCommunity(int communityId) {
		int like = communityDAO.updateLikeCountCommunity(communityId);
		return like > 0;
	}

	@Override
	public boolean updateCommunity(CommunityVO communityVO) {
		int updateVO = communityDAO.updateCommunity(communityVO);
		return updateVO > 0 ;
	}

}
