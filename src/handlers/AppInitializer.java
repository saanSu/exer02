package handlers;

import java.util.LinkedHashSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * application Event용 Listener 2개 
 *  - ServletContextListener : init, destroy
 *  
 *  - ServletContextAttributeListener : setAttribute, removeAttribute
 * 
 * ※ EventListener는 등록이 필요함. (자동으로 등록되지 않는다)
 * 
 */
public class AppInitializer implements ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
		ServletContext ctx = sce.getServletContext();	
		ctx.setRequestCharacterEncoding("UTF-8");
		ctx.setAttribute("users", new LinkedHashSet<>());
		
	}
}
