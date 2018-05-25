package com.ktdsProject.member.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsProject.member.vo.MemberVO;
import com.ktdsProject.member.constants.Member;
import com.ktdsProject.member.service.MemberService;


@Controller
public class MemberController {

	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String doGetLoginPage(HttpSession session) {
		
		if(session.getAttribute(Member.USER) != null ) {
			return "redirect:/list";
		}
		
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String doPostLoginPage(@ModelAttribute("loginForm") MemberVO memberVO, 
			Errors errors, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// FIXME DB에 계정지 존재하지 않을 경우로 변경
		MemberVO loginmember = memberService.readMember(memberVO);
		
		if(loginmember != null) {
			session.setAttribute(Member.USER, loginmember);
			return "redirect:/list";
		}
		return "redirect:/login";
	}
	
	@RequestMapping("/api/exists/email")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsEmail(@RequestParam String email) {
		
		boolean isExists = memberService.readCheckMemberEmail(email);
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isExists);
		
		return response;
	}
	
	@RequestMapping("/api/exists/nickname")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsNickname(@RequestParam String nickname) {
		
		boolean isExists = memberService.readCheckMemberNickname(nickname);
		
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isExists);
		
		return response;
	}


	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String doGetJoinPage() {
		return "member/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView doPostJoinPage(@ModelAttribute("joinForm") @Valid MemberVO memberVO, 
			Errors errors) {
		
		if (errors.hasErrors()) {
			return new ModelAndView("member/regist");
		}
		
		if( memberService.createMember(memberVO)) {
			return new ModelAndView("redirect:/login");
		}
		
		return new ModelAndView("member/regist");
	}
	
	@RequestMapping("/logout")
	public String logoutPage(HttpSession session) {
	
		session.invalidate();

		return "redirect:/list";
	}
	
	@RequestMapping("/mypage")
	public ModelAndView myPage(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("member/mypage");
		return view;
	}
	
	
	@RequestMapping("/test")
	public ModelAndView testPage(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("member/test");
		return view;
	}
}
