package com.ktdsProject.community.web;


import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.ktdsProject.community.service.CommunityService;
import com.ktdsProject.community.vo.CommunityVO;

@Controller
public class CommunityController {
	
	private CommunityService communityService;
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}
	
	@RequestMapping("/list")
	public ModelAndView viewList() {
		
		ModelAndView viewList = new ModelAndView();
		
		viewList.setViewName("community/list");
		
		List<CommunityVO> communityList = communityService.getAll();
		
		viewList.addObject("communityList", communityList);
		
		return viewList;
	
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String doGetWrite() {
		
		return "community/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView doPsotWrite(CommunityVO communityVO) {
		
		boolean isSuccess = communityService.createCommunity(communityVO);		

		if (isSuccess) {
			return new ModelAndView("redirect:/list");
		}

		return new ModelAndView("redirect:/write");
	}
	
	@RequestMapping("/detail/{titleNo}")
	public ModelAndView viewDetail(@PathVariable int titleNo) {
		ModelAndView viewdetail = new ModelAndView();
		
		viewdetail.setViewName("community/detail");
		
		CommunityVO communitydetail = communityService.detailCommunity(titleNo); 
		
		viewdetail.addObject("communitydetail",communitydetail);
	
		return viewdetail;
	}
	
	@RequestMapping("/remove/{titleNo}")
	public String viewRemove(@PathVariable int titleNo) {
		
		boolean remove = communityService.removeCommunity(titleNo); 
		
		if(remove) {
			return "redirect:/list";
		}
		return "redirect:/detail";
	}
	
	@RequestMapping("/viewCount/{titleNo}")
	public String viewCount(@PathVariable int titleNo) {
		
		boolean view = communityService.viewCountCommunity(titleNo);
		
		if (view) {
			return "redirect:/detail/" + titleNo;
		}
		return "redirect:/list";
	}
	
	
	@RequestMapping("/likeCount/{titleNo}")
	public String likeCount(@PathVariable int titleNo) {
		
		communityService.likeCountCommunity(titleNo);

		return "redirect:/detail/" + titleNo;
	}
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView doGetmodify(@PathVariable int titleNo) {
		
		ModelAndView modify = new ModelAndView();
		
		modify.setViewName("community/modify");
		
		CommunityVO communitymodify = communityService.detailCommunity(titleNo);
		
		modify.addObject("communitymodify",communitymodify);
		
		return modify;
		

	}
	


}
