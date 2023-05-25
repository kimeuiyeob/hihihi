<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<HTML>
<HEAD>
</HEAD>
<style>
h1 {
	padding-left: 100px;
}
</style>
<BODY>

	<%
	Connection conn = null;
	try {
		String url = "jdbc:mysql://localhost:33060/kopo07?useSSL=false";
		String user = "root";
		String pw = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pw);
		Statement stmt = conn.createStatement();

		int id = 0;

		ResultSet rset = stmt.executeQuery("select MAX(studentid) from twice");
		while (rset.next()) {
			id = rset.getInt(1);
		}
		
		if(id == 0) {
			id = 209900;
		}
		id++;

		String name = "";
		int kor;
		int eng;
		int mat;

		for (int i = 0; i <= 10; i++) {
		
			name = String.format("홍길동%02d", i);
			kor = (int) (Math.random() * 101);
			eng = (int) (Math.random() * 101);
			mat = (int) (Math.random() * 101);
		
			stmt.execute("insert into twice value('" + name + "'," + id + "," + kor + "," + eng + "," + mat + ",null);");
			id++;
		}
 

		stmt.close();
		conn.close();
		
	%>
	<h1>Table 데이터 값 넣기 성공!!</h1>
	<%
	} catch (Exception e) {
	%>
	<h1>Table 데이터 값 넣기 실패!!</h1>
	<%
	}
	%>

</BODY>
</HTML>