<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="kr.ac.kopo07.ctc.kopo07.dao.*"%>
<%@ page import="kr.ac.kopo07.ctc.kopo07.domain.*"%>

<!-- JDBC 사용시 필요한 임포트 -->
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<HTML>
<HEAD>
</HEAD>

<BODY>
<% 
StudentItemDao studentItemDao = new StudentItemDaoImpl();
studentItemDao.insertRandomStudent10();
%>
	<h1>Table 데이터 값 넣기 성공!!</h1>
</BODY>
</HTML>