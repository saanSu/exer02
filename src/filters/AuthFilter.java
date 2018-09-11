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
		if(session.getAttribute("auth")!=null) {
			chain.doFilter(request, response);
		}else {
			session.setAttribute("dest", request.getRequestURI());
			
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		
	}

}
