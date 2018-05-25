package com.ktdsProject.reply.dao;

import java.util.List;

import com.ktdsProject.reply.vo.ReplyVO;

public interface ReplyDao {
	
	public List<ReplyVO> selectAllReplies(int communityId);
	
	public ReplyVO selectOneReply(int replyId);
	
	public int insertReply(ReplyVO replyVO);
	
	public int deleteReply(int replyId);
	
	public int updateReplyLike(int replyId);
	
	public int updateReplydisLike(int replyId);
	
	public ReplyVO selectReplyLikeAndDisLikeCount(int replyId);
	
	

}
