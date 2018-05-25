package com.ktdsProject.reply.vo;

import com.ktdsProject.community.vo.CommunityVO;
import com.ktdsProject.member.vo.MemberVO;

public class ReplyVO {
	
	private int level;
	
	private int replyId;
	private int memberId;
	private int communityId;
	private String body;
	private String writeDate;
	private int likeCount;
	private int disLikeCount;
	private int parentReplyId;
	
	
	private MemberVO memberVO;
	private CommunityVO communityVO;
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getCommunityId() {
		return communityId;
	}
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getDisLikeCount() {
		return disLikeCount;
	}
	public void setDisLikeCount(int disLikeCount) {
		this.disLikeCount = disLikeCount;
	}
	public int getParentReplyId() {
		return parentReplyId;
	}
	public void setParentReplyId(int parentReplyId) {
		this.parentReplyId = parentReplyId;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public CommunityVO getCommunityVO() {
		return communityVO;
	}
	public void setCommunityVO(CommunityVO communityVO) {
		this.communityVO = communityVO;
	}
	
}
