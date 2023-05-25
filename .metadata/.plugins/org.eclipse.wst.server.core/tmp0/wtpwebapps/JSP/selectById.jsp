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
		font-size :30px;
		font-weight : bold;
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
	input {
	height: 60px;
	width: 300px;
	border-radius: 15px;
	font-size: 20px;
	}
	.but {
		padding-left : 50px;
	}
</style>

<BODY>

	<form action="selectById2.jsp" method="post">
    <div style="display : flex">
		<p>학번 : <input type="text" name="id"> </p>
		<div class="but" style="padding-top: 35px;">
		<button type="submit">조회 하기</button>
		</div>
    </div>
	</form>

</BODY>
</HTML>