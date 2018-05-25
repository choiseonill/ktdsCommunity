package com.ktdsProject.reply.service;

import java.util.List;

import com.ktdsProject.reply.vo.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> readAllReplies(int communityId);
	
	public ReplyVO readOneReply(int replyId);
	
	public boolean createReply(ReplyVO replyVO);
	
	public boolean removeReply(int replyId, int parentReplyId);
	
	public boolean incrementReplyLike(int replyId);
	
	public boolean incrementReplydisLike(int replyId);
	
	public ReplyVO readReplyLikeAndDisLikeCount(int replyId);

}
