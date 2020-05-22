package admin.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class SessionCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	// session 객체를 가져옴
    HttpSession session = request.getSession();
    // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
      
    	if ( session.getAttribute("user_id") == null ){
    		System.out.println("session start: "+session.getAttribute("user_id"));
    		// 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
    		response.sendRedirect("loginForm.do");
    		return false;
    	}
    	
    	return true;
	}


}
