package com.ktdsProject.community.service;

import com.ktdsProject.community.vo.CommunitySearchVO;
import com.ktdsProject.community.vo.CommunityVO;
import com.ktdsProject.webPager.explorer.PageExplorer;

public interface CommunityService {

	public PageExplorer getAll(CommunitySearchVO communitySearchVO);
	
	public boolean createCommunity(CommunityVO communityVO);
	
	public CommunityVO detailCommunity(int communityId);
		
	public boolean removeCommunity(int communityId);
	
	public boolean viewCountCommunity(int communityId);
	
	public boolean likeCountCommunity(int communityId);
	
	public boolean updateCommunity(CommunityVO communityVO);

	
}
