<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="kr.ac.kopo07.ctc.kopo07.dao.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<%
	StudentItemDao studentItemDao = new StudentItemDaoImpl();
	String countingVisitor = studentItemDao.countVisitor();
	%>
	<div style="text-align: center">
		<h1>
			현재 홈페이지 방문자 수 :
			<%=countingVisitor%>
			명입니다.
		</h1>
	</div>
	<div style="display: inline-block; width: 100%;">
		<iframe src="menu.html" frameborder="0" width="25%" align=left
			style="height: 100vh; padding-top: 50px; padding-left: 150px;"></iframe>
		<iframe src="intro.html" name="main" frameborder="0" width="40%"
			align=left style="height: 100vh; padding-top: 50px;"></iframe>
	</div>

</body>
</html>