<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/login.jsp" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("auth")==null){
		throw new RuntimeException();
	}
%>
<%@ include file="/layout/top.jspf"%>
<%@ include file="/layout/nav.jspf" %>
<p>
	<img src="<%=application.getContextPath()%>/image/main.jpg" style="width: 70%; border-radius: 30px"/>
</p>
<%@ include file="/layout/bottom.jspf"%>
