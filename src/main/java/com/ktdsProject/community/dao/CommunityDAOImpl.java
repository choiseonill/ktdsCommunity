package com.ktdsProject.community.dao;

import java.util.ArrayList;
import java.util.List;

import com.ktdsProject.community.vo.CommunityVO;

public class CommunityDAOImpl implements CommunityDAO{
	
	private List<CommunityVO> communityList;

	public CommunityDAOImpl() {
		communityList = new ArrayList<CommunityVO>();
	}

	@Override
	public List<CommunityVO> selectAll() {
		return communityList;
	}

	@Override
	public int insertCommunity(CommunityVO communityVO) {
		communityVO.setTitleNo(communityList.size() + 1);
		communityList.add(communityVO);
		return 1;
	}

	@Override
	public CommunityVO readCommunity(int titleNo) {
		for (CommunityVO communityVO : communityList) {
			if(communityVO.getTitleNo() == titleNo) {
				return communityVO;
			}
		}
		return null;
	}

	@Override
	public int deleteCommunity(int titleNo) {
		for (CommunityVO communityVO : communityList) {
			if(communityVO.getTitleNo() == titleNo) {
				communityList.remove(communityVO);
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int updateViewCountCommunity(int titleNo) {
		for (CommunityVO communityVO : communityList) {
			if(communityVO.getTitleNo() == titleNo) {
				int viewCounts = communityVO.getViewCount();
				communityVO.setViewCount(++viewCounts);
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int updateLikeCountCommunity(int titleNo) {
		for (CommunityVO communityVO : communityList) {
			if(communityVO.getTitleNo() == titleNo) {
				int likeCounts = communityVO.getLikeCount();
				communityVO.setLikeCount(++likeCounts);
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int updateReadPageCommunity(int titleNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	


}
