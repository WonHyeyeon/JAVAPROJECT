<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Join Membership</h1>
	회원가입해주세요! 밑의 모든 내용을 입력하신 후 확인 버튼을 눌러주세요.<p/>
	<form method="post" action="getRegister.jsp">
	ID(아이디) : <input name="id"><p/>
	PASSWORD(비밀번호) : <input name="pwd" type="password"><p/> 
	NAME(이름) : <input name = "name"><p/>
	<input type="submit" value="확인">
	
	</form>
</body>
</html>