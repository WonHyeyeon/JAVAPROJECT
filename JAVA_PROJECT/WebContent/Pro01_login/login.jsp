<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>login</h1>
	<form method = "post" action="isMember.jsp">
	ID : <input name="id"><p/>
	PASSWORD : <input type="password" name="pwd"><p/>
	<input type="submit" value="로그인">
	</form>
	<form method="post" action="joinMembership.jsp">
	<input type="submit" value="회원가입하기">
	</form>
</body>
</html>