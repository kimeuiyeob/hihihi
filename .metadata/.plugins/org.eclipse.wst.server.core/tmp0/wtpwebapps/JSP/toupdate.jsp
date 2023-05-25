<%@ page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%-- 한글 깨짐 --%>
<%
request.setCharacterEncoding("UTF-8");
%>

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

	String name = "";
	int id = 0;
	int kor = 0;
	int eng = 0;
	int mat = 0;

	try {

		String url = "jdbc:mysql://localhost:33060/kopo07?useSSL=false";
		String user = "root";
		String pw = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pw);
		Statement stmt = conn.createStatement();

		//======================= 트와이스 테이블에 값넣기 =======================

		id = Integer.parseInt(request.getParameter("id"));
		name = request.getParameter("name");
		kor = Integer.parseInt(request.getParameter("kor"));
		eng = Integer.parseInt(request.getParameter("eng"));
		mat = Integer.parseInt(request.getParameter("mat"));

		String QueryTxt = " ";
		QueryTxt = String.format("update twice set name='%s', kor='%s', eng='%s', mat='%s'  WHERE studentid='%s';", name,
		kor, eng, mat, id);
		stmt.execute(QueryTxt);

		stmt.close();
		conn.close();

	} catch (SQLException e) {
		;
	}
	%>

	<%-- ====================================================================================================================== --%>

	<h1>회원 수정 성공!!</h1>

	<p>
		이름 : <input type="text" name="name" readonly value="<%=name%>">
	</p>
	<p>
		학번 : <input type="text" name="id" readonly value="<%=id%>">
	</p>
	<p>
		국어 : <input type="number" name="kor" readonly value="<%=kor%>">
	</p>
	<p>
		영어 : <input type="number" name="eng" readonly value="<%=eng%>">
	</p>
	<p>
		수학 : <input type="number" name="mat" readonly value="<%=mat%>">
	</p>

	<div style="padding-left: 125px">
		<button>
			<a href="./intro.html" target="main">첫페이 가기</a>
		</button>
	</div>

</BODY>
</HTML>