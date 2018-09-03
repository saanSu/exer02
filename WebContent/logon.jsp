<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/error/default.jsp" %>
<%@ page import="beans.*" %>
<%@ page import="java.util.*" %>
<%
	String logid =request.getParameter("logid");
	String logpass = request.getParameter("logpass");
	
	AccountDao dao= new AccountDao();
	
	Map acc = dao.getAccountById(logid);
	if(acc== null || !acc.get("pass").equals(logpass)) {
		response.sendRedirect(application.getContextPath()+"/login.jsp?mode=fail");	
	} else {
		Set<String> set =(Set)application.getAttribute("users");
		if(set.contains(logid)) {
			throw new RuntimeException(logid+" is alreay logon"); 
		}else {
			set.add(logid);
			
			application.setAttribute("users", set);	// 생략이 가능하긴 함. Why?
					
			session.setAttribute("auth", true);
			session.setAttribute("logid", logid);
			
			LoginLogDao ldao = new LoginLogDao();
			Map log = ldao.getLatesetLogById(logid);
			if(log != null) {
				session.setAttribute("latest", log.get("time"));
			}
			
			ldao.addLog(logid);
			response.sendRedirect(application.getContextPath()+"/");
		}
	}
%>

