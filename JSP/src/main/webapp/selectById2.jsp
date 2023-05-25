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

<script src="//code.jquery.com/jquery-3.3.1.js"></script>

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

<script>
	function update() {
		const form = document.getElementById('form')
		form.action = "toupdate.jsp";
		form.submit();
	}

	function deletes() {
		const form = document.getElementById('form')
		form.action = "todelete.jsp";
		form.submit();
	}
</script>

<BODY>

	<%-- ====================================================================================================================== --%>
	<!-- Mysql데이터 베이스 연결 -->
	<%
	Connection conn = null;
	int idNumber = 0;

	String name = "";
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
		idNumber = Integer.parseInt(request.getParameter("id"));

		ResultSet rset = stmt.executeQuery("select * from twice where studentid=" + idNumber + "");

		while (rset.next()) {

			name = rset.getString(1);
			kor = rset.getInt(3);
			eng = rset.getInt(4);
			mat = rset.getInt(5);
		}

		if (name.equals("")) {
	%>

	<h1>해당 아이디가 없습니다.</h1>
		<div style="padding-left: 180px;">
			<button type="button" onclick="history.back(-1);">뒤로가기</button>
		</div>
	
	<%
	} else {
	%>


	<div id="score">
		<form id="form" method="post">

			<p>
				이름 : <input type="text" name="name" value="<%=name%>">
			</p>
			<p>
				학번 : <input type="text" name="id" readonly value="<%=idNumber%>">
			</p>
			<p>
				국어 : <input type="number" name="kor" value="<%=kor%>">
			</p>
			<p>
				영어 : <input type="number" name="eng" value="<%=eng%>">
			</p>
			<p>
				수학 : <input type="number" name="mat" value="<%=mat%>">
			</p>

			<div style="display: flex">
				<div class="but">
					<button type="button" onclick="update();">수정하기</button>
				</div>

				<div style="padding-left: 20px;">
					<button type="button" onclick="deletes();">삭제하기</button>
				</div>

			</div>

		</form>
	</div>

	<%
	stmt.close();
	conn.close();
	rset.close();
	}
	} catch (SQLException e) {
	;
	}
	%>

	<%-- ====================================================================================================================== --%>

</BODY>
</HTML>