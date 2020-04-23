<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String query = "SELECT * FROM member WHERE pwd='" + pwd +"' AND id='" + id + "';";
	System.out.println(query);
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Pro01_login", "root", "1234");
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>login</h1>
	<%
	if(rs.next()){
	%>
	<%=id %>님은 저희의 회원입니다.<p/>
	정상적으로 로그인 되었습니다.	
	<% 
	}else{ 
	%>
	<%=id %>님은 저희의 회원이 아닙니다.<p/>
	회원가입 부탁드립니다.<p/>
	<form method="post" action="joinMembership.jsp">
	<input type="submit" value="회원가입하기">
	</form>
	<% 
	}
	}catch(SQLException ex){
		System.out.println("sql exception : " + ex);
	}catch(Exception ex){
		System.out.println("exception : " + ex);
	}finally{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	%>
</body>
</html>