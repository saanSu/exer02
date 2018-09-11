package handlers;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import beans.LoginLogDao;

public class CookieHandler implements ServletRequestListener {
	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		ServletRequest req = sre.getServletRequest();
		HttpServletRequest request = (HttpServletRequest) req;
		if (request.getSession().isNew()) {
			Cookie[] ar = request.getCookies();
			String freepass = null;
			if (ar != null) {
				for (int i = 0; i < ar.length; i++) {
					if (ar[i].getName().equals("freepass")) {
						freepass = ar[i].getValue();
					}
				}
			}
			// ===================================================================
			if (freepass != null) {
				System.out.println("[CookieHandler] this client has a freepass cookie. value is " + freepass);
				HttpSession session= request.getSession();
				session.setAttribute("auth", true);
				session.setAttribute("logid", freepass);
				
				
				LoginLogDao ldao = new LoginLogDao();
				Map log = ldao.getLatesetLogById(freepass);
				if (log != null) {
					session.setAttribute("latest", log.get("time"));
				}

				ldao.addLog(freepass);

			} else {
				System.out.println("[CookieHandler] this client does not have a freepass cookie");
			}
		}
	}

}


