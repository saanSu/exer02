<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>
<%@ page import="java.util.*" %>
<%
	BoardDao bdao = new BoardDao();
	List<Map> list=bdao.getAllDatas();
	SimpleDateFormat df = new SimpleDateFormat("HH:mm");
	
%>
<%@ include file="/layout/top.jspf"%>
<%@ include file="/layout/nav.jspf" %>
<h1>《게시판》</h1>
<p style="font-size: small;">
	서비스 사용자들이 올린 글들을 공유시켜드립니다.	글에 첨부된 파일들은 다운 받아보실수 있습니다.
</p>
<p style="text-align: right"> 
	총 게시글 수 : <b><%=list.size() %></b> | 
	<a href="<%=application.getContextPath() %>/board/write.jsp"><button type="button">글작성</button></a>
</p> 
<div align="center">
	<%for(int i=0; i<list.size(); i++) { 
		Map one = list.get(i);	
		%>
		<p style="width: 90%; text-align: left; border-bottom: 1px gray dotted; padding:5px;">
		<small>#<%=one.get("NO") %></small> / 
		<a href="<%=application.getContextPath()%>/board/view.jsp?no=<%=one.get("NO")%>"><b><%=one.get("TITLE") %></b></a> /  
		<small style="color: gray;">작성자:<%=one.get("WRITER") %> / <%=df.format(one.get("LEFTDATE")) %> / 추천:<%=one.get("GOOD") %></small>
		</p>
	<%} %>
</div>
<%@ include file="/layout/bottom.jspf"%>










