<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.sql.*" %>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String query = "INSERT INTO member(id, pwd, NAME) values('" + id + "','"+pwd+"','"+name+"')";
	System.out.println(query);
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Pro01_login", "root", "1234");
		stmt = conn.createStatement();
		stmt.executeUpdate(query);//db insert
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입완료</h1>
	<%=id %>님의 회원가입을 진심으로 환영합니다.<p/>
	<%
	}catch(SQLException ex){
		System.out.println("sql exception : " + ex);
	}catch(Exception ex){
		System.out.println("exception : " + ex);
	}finally{
		if(rs != null) rs.close();
		if(stmt !=  null) stmt.close();
		if(conn != null) conn.close();
	}
	%>
</body>
</html>