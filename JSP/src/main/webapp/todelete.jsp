<%@ page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<HTML>
<HEAD>
</HEAD>
<style>
p {
	font-size: 30px;
	font-weight: bold;
}

button {
	background-color: #6a6a76;
	color: #fff;
	border: none;
	border-radius: 10px;
	box-shadow: 0px 0px 2px 2px rgb(102, 101, 101);
	height: 50px;
	width: 150px;
	cursor: pointer;
	font-size: 20px;
}

input {
	height: 60px;
	width: 300px;
	border-radius: 15px;
	font-size: 20px;
}

.but {
	padding-left: 50px;
}

a {
	text-decoration: none;
	color: white;
}

h1 {
	padding-left: 100px;
}
</style>

<BODY>

	<%-- ====================================================================================================================== --%>
	<!-- Mysql데이터 베이스 연결 -->
	<%
	Connection conn = null;
	int id = 0;

	try {
		String url = "jdbc:mysql://localhost:33060/kopo07?useSSL=false";
		String user = "root";
		String pw = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pw);
		Statement stmt = conn.createStatement();

		//======================= 트와이스 테이블에 값넣기 =======================

		id = Integer.parseInt(request.getParameter("id"));
		stmt.executeUpdate("delete from twice where studentid =" + id + "");

		stmt.close();
		conn.close();
	%>
	<h1>회원 수정 성공!!</h1>
	<div style="padding-left: 125px">
		<button>
			<a href="./intro.html" target="main">첫페이 가기</a>
		</button>
	</div>
	<%
	} catch (SQLException e) {
	;
	}
	%>

</BODY>
</HTML>