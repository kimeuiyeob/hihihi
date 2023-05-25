<%@ page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

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
</style>

<script>
	/* number type 글자수 제한 함수 */
	function maxLengthCheck(object) {
		if (object.value.length > object.maxLength) {
			object.value = object.value.slice(0, object.maxLength);
		}
	}
</script>

<BODY>

	<%-- ====================================================================================================================== --%>

	<!-- Mysql데이터 베이스 연결 -->
	<%
	Connection conn = null;
	int maxNumber = 0;
	int minNumber = 0;
	int number = 0;

	int newID = 0;
	List<Integer> studentList = new ArrayList<>();

	try {
		String url = "jdbc:mysql://localhost:33060/kopo07?useSSL=false";
		String user = "root";
		String pw = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pw);
		Statement stmt = conn.createStatement();

		//======================= 트와이스 테이블에 값넣기 =======================

		ResultSet rset = stmt.executeQuery("select MAX(studentid),MiN(studentid) from twice");

		while (rset.next()) {
			maxNumber = rset.getInt(1);
			minNumber = rset.getInt(2);
		}

		ResultSet rset2 = stmt.executeQuery(
		"select studentid from twice where studentid >= " + minNumber + " and studentid <= " + maxNumber + ";");

		while (rset2.next()) {
			int num = rset2.getInt(1);
			studentList.add(num);
		}


		for (int i = 0; i < maxNumber; i++) {
			if ((i + 1) != studentList.get(i)) {
				newID = i + 1;
				break;
			} else {
				newID = maxNumber + 1;
			}
		}

		maxNumber++;

		stmt.close();
		conn.close();
		rset.close();
		rset2.close();
		
	} catch (SQLException e) {
		;
	}
	
	%>


	<%-- ====================================================================================================================== --%>

	<form action="insert2.jsp" method="post">
		<p>
			이름 : <input type="text" name="name" maxlength="8">
		</p>
		<p>
			학번 : <input type="text" name="id" readonly value="<%=newID%>">
		</p>
		<p>
			국어 : <input type="number" name="kor" maxlength="3"
				oninput="maxLengthCheck(this)">
		</p>
		<p>
			영어 : <input type="number" name="eng" maxlength="3"
				oninput="maxLengthCheck(this)">
		</p>
		<p>
			수학 : <input type="number" name="mat" maxlength="3"
				oninput="maxLengthCheck(this)">
		</p>
		
		<div style="display: flex">
			<div class="but">
				<button type="submit">추가</button>
			</div>
			<div style="padding-left: 20px;">
				<button type="button" onclick="history.back(-1);">뒤로가기</button>
			</div>
		</div>
		
	</form>



</BODY>
</HTML>