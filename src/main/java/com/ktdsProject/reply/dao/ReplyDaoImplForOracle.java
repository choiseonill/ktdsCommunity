package com.ktdsProject.reply.dao;

import java.util.List;

import org.aspectj.weaver.bcel.BcelGenericSignatureToTypeXConverter.GenericSignatureFormatException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.util.SystemPropertyUtils;

import com.ktdsProject.reply.vo.ReplyVO;

public class ReplyDaoImplForOracle extends SqlSessionDaoSupport implements ReplyDao {

	@Override
	public List<ReplyVO> selectAllReplies(int communityId) {
		return getSqlSession().selectList("ReplyDao.selectAllReplies", communityId);
	}

	@Override
	public ReplyVO selectOneReply(int replyId) {
		return getSqlSession().selectOne("ReplyDao.selectOneReply", replyId);
	}
	
	@Override
	public int insertReply(ReplyVO replyVO) {
		int sequence = getSqlSession().selectOne("ReplyDao.nextValue");
		replyVO.setReplyId(sequence);
		return getSqlSession().insert("ReplyDao.insertReply", replyVO);
	}

	@Override
	public int deleteReply(int replyId) {
		return getSqlSession().delete("ReplyDao.deleteReply", replyId);
	}

	@Override
	public int updateReplyLike(int replyId) {
		System.out.println(replyId+"testtest");
		return getSqlSession().update("ReplyDao.updateReplyLike", replyId);
	}
	
	@Override
	public int updateReplydisLike(int replyId) {
		return getSqlSession().update("ReplyDao.updateReplydisLike",replyId);
	}

	@Override
	public ReplyVO selectReplyLikeAndDisLikeCount(int replyId) {
		return getSqlSession().selectOne("ReplyDao.selectReplyLikeAndDisLikeCount", replyId);
	}




}
