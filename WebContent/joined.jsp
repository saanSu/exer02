<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/error/default.jsp"%>
<%@ page import="beans.*"%>
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String gender = request.getParameter("gender");
	if (!id.matches("\\w{4,12}") || !name.matches("[가-힇]{2,}") || pass.length() < 4) {
		throw new IllegalArgumentException("invalid data type");
	}
	AccountDao dao = new AccountDao();
	int n = dao.addAccount(id, pass, name, gender);
%>
<%@ include file="/layout/top.jspf"%>
<h3>
	Join | <a href="<%=application.getContextPath()%>/login.jsp">Login</a>
</h3>
<%
	if (n == 1) {
%>
<p>
	<b><%=name%></b>님<br /> 요청하신 <b><%=id%> (<%=pass.substring(0, 2)%>****)</b>로<br />
	사용자 계정이 <b style="color: blue;">생성</b>되었습니다.<br /> 해당 계정으로 로그인하여<br />
	<b><a href="<%=application.getContextPath()%>/login.jsp">【app.Unknown】</a></b>의
	다양한 서비스를<br /> 이용하실 수 있습니다.
</p>
<%
	} else {
%>
<p>
	<b><%=name%></b>님<br /> 요청하신 <b><%=id%></b> 계정은<b style="color: red">생성실패</b>
	하였습니다.<br /> 이미 다른 사용자가 이용중인 계정일 수 있으니<br /> <a
		href="<%=application.getContextPath()%>/join.jsp"><b>다시 시도</b></a>해주십시요.
</p>
<%
	}
%>
<%@ include file="/layout/bottom.jspf"%>