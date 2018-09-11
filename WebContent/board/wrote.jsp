<%@ page import="beans.BoardDao"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%
	Map data = new HashMap();
	MultipartParser parser = new MultipartParser(request, 1024*1024*100, true,true,"UTF-8");
	Part part;
	while( (part= parser.readNextPart() ) != null) {
		if(part.isParam()) {
			ParamPart param = (ParamPart)part;
			if(param.getName().equals("title")) {
				data.put("title", param.getStringValue());
			}else if(param.getName().equals("content")) {
				data.put("content", param.getStringValue());
			}else {
				
			}
			// data.put(param.getName(), param.getStringValue());
		}else {
			FilePart file = (FilePart)part;
			String fileName = file.getFileName();	
			long curr = System.currentTimeMillis();
			File dir = new File(application.getRealPath("/storage"), String.valueOf(curr));
			dir.mkdirs();
			file.writeTo(dir);
			String attach = "/storage/"+curr+"/"+fileName;			
			
			data.put("attach", attach);
		}
	}
	//========================================================================================
	data.put("writer", session.getAttribute("logid"));
	System.out.println(data);
	BoardDao bdao = new BoardDao();
	int r =bdao.addData(data);
%>
<%@ include file="/layout/top.jspf"%>
<%@ include file="/layout/nav.jspf" %>
<h1>《게시글 작성》</h1>
<p>
	<%if(r==1){ %>
		게시글이 <b style="color: blue">정상</b>적으로 <b style="color: blue">등록</b>되었습니다.
	<%}else { %>


	<%} %>
</p>
<p>
	<a href="<%=application.getContextPath()%>/board/list.jsp"><button type="button">목록으로</button></a>
</p>	
<%@ include file="/layout/bottom.jspf"%>





