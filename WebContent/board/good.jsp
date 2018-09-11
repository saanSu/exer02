<%-- 특정 키에 해당하는 데이터 출력 --%>
<%@page import="beans.GoodLogDao"%>
<%@ page import="java.util.*"%>
<%@ page import="beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String id = (String) session.getAttribute("logid");
	Map data = new HashMap();
	data.put("actor", id);
	data.put("target", no);

	GoodLogDao good = new GoodLogDao();
	int r = good.addLog(data);
	if (r == 1) {
		BoardDao board = new BoardDao();
		board.increaseGoodByNo(no);
		response.sendRedirect(application.getContextPath() + "/board/view.jsp?no=" + no);

	} else {
%>
<%@ include file="/layout/top.jspf"%>
<%@ include file="/layout/nav.jspf"%>
<h1>《추천하기》</h1>
<p>이미 삭제된 글, 혹은 추천하신글입니다.</p>

<%@ include file="/layout/bottom.jspf"%>
<%
	}
%>