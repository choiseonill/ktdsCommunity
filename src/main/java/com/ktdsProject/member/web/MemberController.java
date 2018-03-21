package com.ktdsProject.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String viewLoginPage(HttpSession session) {
		
		if(session.getAttribute(Member.USER) != null ) {
			return "redirect:/list";
		}
		
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String doLoginAction(MemberVO memberVO, Errors errors, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// FIXME DB에 계정지 존재하지 않을 경우로 변경
		MemberVO loginmember = memberService.readMember(memberVO);
		
		if(loginmember != null) {
			session.setAttribute(Member.USER, loginmember);
			return "redirect:/list";
		}
		return "redirect:/login";
	}


	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String viewJoinPage() {
		return "member/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView doJoinAction(@ModelAttribute("joinForm") @Valid MemberVO memberVO, Errors errors) {
		
		if (errors.hasErrors()) {
			return new ModelAndView("member/regist");
		}
		
		if( memberService.createMember(memberVO)) {
			return new ModelAndView("redirect:/login");
		}
		
		return new ModelAndView("member/regist");
	}
	
	@RequestMapping("/logout")
	public String logoutAction(HttpSession session) {
	
		session.invalidate();

		return "redirect:/list";
	}
	
	@RequestMapping("/mypage")
	public ModelAndView viewLoginPage5(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("member/mypage");
		return view;
	}
}
