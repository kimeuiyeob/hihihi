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
		font-size :20px;
		font-weight : bold;
	}

	input {
	height: 60px;
	width: 300px;
	border-radius: 15px;
	font-size: 20px;
	}

	button {
    background-color:#6a6a76;
    color: #fff;
    border:none;
    border-radius:10px;
    box-shadow: 0px 0px 2px 2px rgb(102 101 101);
    height: 50px;
    width: 150px;
    cursor: pointer;
    font-size: 20px;
    }
    a {
	text-decoration: none;
	color : white;
	}
	
	h1 {
	padding-left : 100px;
	}
    
</style>
<BODY>
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

        //======================= 트와이스 테이블에 값넣기 =======================

		String name = "";
		int id = 0;
		int korea = 0;
		int english = 0;
		int math = 0;

        try {

        name = request.getParameter("name");
        id = Integer.parseInt(request.getParameter("id"));
        korea = Integer.parseInt(request.getParameter("kor"));
        english = Integer.parseInt(request.getParameter("eng"));
        math = Integer.parseInt(request.getParameter("mat"));

        } catch(Exception e) {
        }

        if(name.equals("")) {
            name = "없음";
        }
	
        stmt.execute("insert into twice value('"+name+"'," + id + "," + korea + "," + english + "," + math + ");");
        
        stmt.close(); 
        conn.close(); 
    %>

        <h1>테이블 값 넣기 성공!!</h1>

		<p>이름 : <input type="text" readonly value="<%= name%>"></p>
		<p>학번 : <input type="text" readonly value="<%= id%>"></p>
		<p>국어 : <input type="text" readonly value="<%= korea%>"></p>
		<p>영어 : <input type="text" readonly value="<%= english%>"></p>
		<p>수학 : <input type="text" readonly value="<%= math%>"></p>

		<div style="padding-left : 125px">
			<button>
				<a href="./intro.html" target="main">첫페이 가기</a>
			</button>
		</div>


    <%
	} catch (SQLException e) {
        
	%>
		<h1>테이블을 우선 생성해주세요!!</h1>
	<%
	}
	%>

</BODY>
</HTML>