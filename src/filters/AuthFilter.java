package filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter extends HttpFilter {
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("[AuthFilter] at " + request.getRequestURI());
		HttpSession session =request.getSession();
		// 사용자세션에 인증을 나타내는 키가 
	//	boolean b = (Boolean)session.getAttribute("auth");
		if(session.getAttribute("auth")!=null) {
			// session.getAttribute("auth")!=null
			// 있으면 통과
			chain.doFilter(request, response);
		}else {
			// 없으면 로그인으로 리다이렉트
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		
		
		
		
	}

}
