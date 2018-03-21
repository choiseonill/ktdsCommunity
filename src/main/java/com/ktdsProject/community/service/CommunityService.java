package com.ktdsProject.community.service;

import java.util.List;

import com.ktdsProject.community.vo.CommunityVO;

public interface CommunityService {

	public List<CommunityVO> getAll();
	
	public boolean createCommunity(CommunityVO communityVO);
	
	public CommunityVO detailCommunity(int titleNO);
		
	public boolean removeCommunity(int titleNo);
	
	public boolean viewCountCommunity(int titleNo);
	
	public boolean likeCountCommunity(int titleNo);

	
}
