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
	}else {
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
%>
