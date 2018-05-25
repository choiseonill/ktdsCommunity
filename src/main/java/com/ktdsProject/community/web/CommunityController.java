package com.ktdsProject.community.web;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsProject.community.service.CommunityService;
import com.ktdsProject.community.vo.CommunitySearchVO;
import com.ktdsProject.community.vo.CommunityVO;
import com.ktdsProject.member.constants.Member;
import com.ktdsProject.member.vo.MemberVO;
import com.ktdsProject.webPager.explorer.PageExplorer;

@Controller
public class CommunityController {

	private CommunityService communityService;

	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}
 
	@RequestMapping("/list")
	public ModelAndView viewList(CommunitySearchVO communitySearchVO , HttpSession session) {
		
		if( communitySearchVO.getPageNo() < 0) {
			communitySearchVO = (CommunitySearchVO) session.getAttribute("__SEARCH__");
			
			if( communitySearchVO == null) {
				communitySearchVO = new CommunitySearchVO();
				communitySearchVO.setPageNo(0);
			}
		}
		
		session.setAttribute("__SEARCH__", communitySearchVO );

		ModelAndView viewList = new ModelAndView();

		viewList.setViewName("community/list");

		PageExplorer pageExplorer = communityService.getAll(communitySearchVO);

		viewList.addObject("pageExplorer", pageExplorer);

		return viewList;

	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String doGetWrite() {

		return "community/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String doPsotWrite(@ModelAttribute("writeForm") CommunityVO communityVO, 
			HttpSession session ) {

		communityVO.save();
		
		boolean isSuccess = communityService.createCommunity(communityVO);

		if (isSuccess) {
			return "redirect:/list";
		}
		return "redirect:/write";
	}

	@RequestMapping("/detail/{communityId}")
	public ModelAndView viewDetail(@PathVariable int communityId) {
		ModelAndView viewdetail = new ModelAndView();

		viewdetail.setViewName("community/detail");

		CommunityVO communitydetail = communityService.detailCommunity(communityId);

		viewdetail.addObject("communitydetail", communitydetail);

		return viewdetail;
	}

	@RequestMapping("/remove/{communityId}")
	public String viewRemove(@PathVariable int communityId) {

		boolean remove = communityService.removeCommunity(communityId);
		
		if (remove) {
			return "redirect:/list";
		}
		return "redirect:/detail/" + communityId;
	}

	@RequestMapping("/viewCount/{communityId}")
	public String viewCount(@PathVariable int communityId) {

		boolean view = communityService.viewCountCommunity(communityId);

		if (view) {
			return "redirect:/detail/" + communityId;
		}
		return "redirect:/list";
	}

	@RequestMapping("/likeCount/{communityId}")
	public String likeCount(@PathVariable int communityId) {

		communityService.likeCountCommunity(communityId);

		return "redirect:/detail/" + communityId;
	}
	
	@RequestMapping(value = "/modify/{communityId}" , method = RequestMethod.GET)
	public ModelAndView doGetModify (@PathVariable int communityId, HttpSession session) {
		System.out.println(communityId);
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		
		CommunityVO communityModify = communityService.detailCommunity(communityId);
		
		int userId = member.getMemberId();
		
		if( userId != communityModify.getMemberId()) {
				return new ModelAndView("redirect:/write/" + communityId);
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("community/write");
		view.addObject("communityModify" , communityModify);
		view.addObject("mode", "modify");
		
		return view;
	}
	
	@RequestMapping(value = "/modify/{communityId}", method = RequestMethod.POST)
	public String doPostModify (@PathVariable int communityId, HttpSession session, CommunityVO communityVO) {
		
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
	
		CommunityVO originalVO = communityService.detailCommunity(communityId);
	
	
		
		if ( member.getMemberId() != originalVO.getMemberId()) {
			return "error/404";
		}
		
		CommunityVO newCommunity = new CommunityVO();
		newCommunity.setCommunityId(originalVO.getCommunityId());
		newCommunity.setMemberId(member.getMemberId());
		
		System.out.println(communityVO.getBody() + "???");
		
		boolean isModify = false;
		//1. 제목 변경확인
		if (!originalVO.getTitle().equals(communityVO.getTitle())) {
			newCommunity.setTitle(communityVO.getTitle());
		}
		
		//2. 내용 변경확인
		if (!originalVO.getBody().equals(communityVO.getBody())) {
			newCommunity.setBody(communityVO.getBody());
		}
		
		// 3. 파일 변경확인
		if ( communityVO.getDisplayFilename().length() > 0 ) {
			File file = new File("D:/uploadFiles/" + communityVO.getDisplayFilename());
			file.delete();
			communityVO.setDisplayFilename("");
		}
		
		else {
			communityVO.setDisplayFilename(originalVO.getDisplayFilename());
		}
		
		communityVO.save();
		if(originalVO.getDisplayFilename().equals(communityVO.getDisplayFilename())) {
			newCommunity.setDisplayFilename(communityVO.getDisplayFilename());
			isModify = true;
		}
		if(isModify) {
			communityService.updateCommunity(newCommunity);
		}
		
		return "redirect:/detail/" + communityId;
	}


}
