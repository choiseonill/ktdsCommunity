package com.ktdsProject.community.dao;

import java.util.List;

import com.ktdsProject.community.vo.CommunitySearchVO;
import com.ktdsProject.community.vo.CommunityVO;

public interface CommunityDAO {
	
	//페이징
	public int selectCountAll(CommunitySearchVO communitySearchVO);
	
	//전체 리스트 조회하기 /list
	public List<CommunityVO> selectAll(CommunitySearchVO communitySearchVO); 
	
	//write
	public int insertCommunity(CommunityVO communityVO);
	
	//detail
	public CommunityVO readCommunity(int communityId);
	
	//remove
	public int deleteCommunity(int communityId);
	
	//조회수 증가
	public int updateViewCountCommunity(int communityId);
	
	//좋아요 증가
	public int updateLikeCountCommunity(int communityId);
	
	//modify 수정된 부분 업데이트
	public int updateCommunity(CommunityVO communityVO);

	
}
