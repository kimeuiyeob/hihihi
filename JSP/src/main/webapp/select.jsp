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
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  padding: 6px 15px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: left;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}
h1 {
padding-left : 100px;
}
</style>
<BODY>

<center>
    <table>
        <table>
        <thead>
            <tr id="thead">
                <th>이름</th>
                <th>번호</th>
                <th>국어점수</th>
                <th>영어점수</th>
                <th>수학점수</th>
            </tr> 
        </thead>  

	<!-- Mysql데이터 베이스 연결 -->
	<%

	Connection conn = null;
	try {
		String url = "jdbc:mysql://localhost:33060/kopo07?useSSL=false";
		String user = "root";
		String pw = "1234";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pw);
		Statement stmt = conn.createStatement();

        //======================= 트와이스 테이블 하나 조회하기 =======================

        String id = "";
        try {
        id =  request.getParameter("id");
        } catch(Exception e) {
        }

        ResultSet rset = stmt.executeQuery("select * from twice where studentid="+id+"");

        while(rset.next()) {

        String name = rset.getString(1);
        int idid = rset.getInt(2);
        int kor = rset.getInt(3);
        int eng = rset.getInt(4);
        int mat = rset.getInt(5);

    %>
    <tbody>
        <tr>
            <td><%=name%></td>
            <td><%=idid%></td>
            <td><%=kor%></td>
            <td><%=eng%></td>
            <td><%=mat%></td>
        </tr>  
    </tbody>
    <%

    stmt.close(); 
    conn.close(); 
    
    }
	} catch (SQLException e) {
        
	%>

		<h1>테이블을 우선 생성해주세요!!</h1>

	<%
	}
	%>
    </table>
</center>

</BODY>
</HTML>