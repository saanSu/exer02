<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%@ include file="/layout/nav.jspf" %>
<h1>《게시글 작성》</h1>
<p style="font-size: small;">
	서비스 사용자들과 공유하고 싶은 내용/자료를 작성해주세요.<br /> 파일첨부는 1회당 1개, 100MB 까지 지원합니다.
</p>
<form method="post"
	action="<%=application.getContextPath()%>/board/wrote.jsp" enctype="multipart/form-data">
	<p>
		글제목(*)<br /> <input type="text" placeholder="write a title"
			style="width: 320px; padding: 5px;" name="title" />
	</p>
	<p>
		글내용(*)<br />
		<textarea name="content"
			style="height: 170px; width: 320px; padding: 5px; resize: none; font-family: inherit;"
			placeholder="write a content"></textarea>
	</p>
	<p>
		파일첨부<br /> <input type="file" style="width: 320px; padding: 5px;" name="attach" />
	</p>
	<button type="submit" style="width: 330px; padding: 5px;">글 공유</button>
</form>
<%@ include file="/layout/bottom.jspf"%>
