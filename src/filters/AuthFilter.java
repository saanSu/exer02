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
		// ����ڼ��ǿ� ������ ��Ÿ���� Ű�� 
	//	boolean b = (Boolean)session.getAttribute("auth");
		if(session.getAttribute("auth")!=null) {
			// session.getAttribute("auth")!=null
			// ������ ���
			chain.doFilter(request, response);
		}else {
			// ������ �α������� �����̷�Ʈ
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		
		
		
		
	}

}
