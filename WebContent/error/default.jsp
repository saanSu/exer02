<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%
	response.setStatus(200);
%>
<%@ include file="/layout/top.jspf"%>
	<h3 style="color: red">ERROR</h3>
	<p>
		<%=exception.toString() %>
	</p>
<%@ include file="/layout/bottom.jspf"%>