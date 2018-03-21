package com.ktdsProject.community.dao;

import java.util.List;

import com.ktdsProject.community.vo.CommunityVO;

public interface CommunityDAO {

	public List<CommunityVO> selectAll();
	
	public int insertCommunity(CommunityVO communityVO);
	
	public CommunityVO readCommunity(int titleNo);
	
	public int deleteCommunity(int titleNo);
	
	public int updateViewCountCommunity(int titleNo);
	
	public int updateLikeCountCommunity(int titleNo);
	
	public int updateReadPageCommunity(int titleNo);
	
}
