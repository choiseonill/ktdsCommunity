package com.ktdsProject.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogincCheckInterceptor extends HandlerInterceptorAdapter{

	/** admin계정의 비밀번호 오류 횟수*/
	private static int adminFailCounter = 0;
	
	/** admin block 상태
	 * true = block on
	 * false = block off
	*/
	private static boolean adminBlock = false;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("LogincCheckInterceptor in");
		RequestDispatcher rd;
		
		// login btn 눌렀을 때
		if(request.getMethod().equals("POST")) {

			// admin block on 
			// && Id admin 일 때 redirect
			if(adminBlock && request.getParameter("userId").equals("admin")) {
				
				rd = request.getRequestDispatcher("/WEB-INF/view/error/404.jsp");
				rd.forward(request, response);
				return false;
			}
			
			// adminFailCounter ++
			if(request.getParameter("userId").equals("admin") && !request.getParameter("userPassword").equals("1234")) {
				adminFailCounter++;
			}
				
//			// 4번째 오류 시 redirect 후 adminBlock on
//			if(adminFailCounter > 3 ) {
//				rd = request.getRequestDispatcher("/WEB-INF/view/error/404.jsp");
//				rd.forward(request, response);
//				adminBlock = true;
//				return false;
//			}
		}
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
}
