package com.ktdsProject.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsProject.member.constants.Member;
import com.ktdsProject.member.vo.MemberVO;
import com.ktdsProject.reply.service.ReplyService;
import com.ktdsProject.reply.vo.ReplyVO;




@Controller
public class ReplyController{
	
	private ReplyService replyService;
	
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	
	@RequestMapping(value = "/api/reply/{communityId}", method = RequestMethod.GET)
	@ResponseBody
	public List<ReplyVO> getAllReplies(@PathVariable int communityId) {
		return replyService.readAllReplies(communityId);
	}

	
	@RequestMapping(value = "/api/reply/{communityId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createReply(@PathVariable int communityId, HttpSession session, ReplyVO replyVO) {
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		replyVO.setMemberId(member.getMemberId());
		replyVO.setCommunityId(communityId);
		
		boolean isSuccess = replyService.createReply(replyVO);
		
		ReplyVO newReply = null;
		if ( isSuccess ) {
			newReply = replyService.readOneReply(replyVO.getReplyId());
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", isSuccess);
		result.put("reply", newReply);
		
		return result;
	}
	
	
	@RequestMapping(value= "/api/like/{replyId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateReplyLikeCount(@PathVariable int replyId){

		boolean isSuccess = replyService.incrementReplyLike(replyId);
		
		int likeCount = 0;
		if( isSuccess ) {

			ReplyVO replyVO = replyService.readReplyLikeAndDisLikeCount(replyId);
			likeCount = replyVO.getLikeCount();
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("likeCount", likeCount);
		result.put("response", isSuccess); 
		
		return result;

	}
	
	
	@RequestMapping(value="/api/disLike/{replyId}", method = RequestMethod.POST)
	@ResponseBody
	
	public Map<String, Object> updateReplydisLikeCount(@PathVariable int replyId){
		
		boolean isSuccess = replyService.incrementReplydisLike(replyId);
		
		int disLikeCount = 0;
		if (isSuccess) {
			
			ReplyVO replyVo = replyService.readReplyLikeAndDisLikeCount(replyId);
			disLikeCount = replyVo.getDisLikeCount();
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("disLikeCount", disLikeCount);
		result.put("response", isSuccess); 
		
		return result;
		
	
	}
	
}
