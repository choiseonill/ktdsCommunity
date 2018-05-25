package com.ktdsProject.reply.service;

import java.util.List;

import com.ktdsProject.reply.dao.ReplyDao;
import com.ktdsProject.reply.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{
	
	private ReplyDao replyDao;
		
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public List<ReplyVO> readAllReplies(int communityId) {
		return replyDao.selectAllReplies(communityId);
	}

	@Override
	public ReplyVO readOneReply(int replyId) {
		return replyDao.selectOneReply(replyId);
	}
	
	@Override
	public boolean createReply(ReplyVO replyVO) {
		return replyDao.insertReply(replyVO) > 0;
	}

	@Override
	public boolean removeReply(int replyId, int parentReplyId) {
		return replyDao.deleteReply(replyId) > 0;
	}

	@Override
	public boolean incrementReplyLike(int replyId) {
		return replyDao.updateReplyLike(replyId) > 0;
	}

	@Override
	public ReplyVO readReplyLikeAndDisLikeCount(int replyId) {
		return replyDao.selectReplyLikeAndDisLikeCount(replyId);
	}

	@Override
	public boolean incrementReplydisLike(int replyId) {
		return replyDao.updateReplydisLike(replyId) > 0;
	}


}
