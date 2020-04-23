<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	Cookie[] cookies = request.getCookies();
	if(cookies != null){ //이전에 로그인하여 세션이 유지되고 있다면
		for(int i = 0; i<cookies.length; i++)
		{
			if(cookies[i].getName().equals("login")){
				id = cookies[i].getValue();
			}
		}
		if(!id.equals(""))
		{
			System.out.println("check cookie");
%>
	<script>
	alert("로그인 되었습니다.");
	location.href="successLogin.jsp?"; //로그아웃 버튼 누를수 있는 페이지로 이동한다.
	</script>
<%
		}
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>login</h1>
	<form method = "post" action="isMember.jsp">
	ID : <input name="id"><p/>
	PASSWORD : <input type="password" name="pwd"><p/>
	<input type="submit" value="로그인">
	</form>
	<form method="post" action="member.jsp">
	<input type="submit" value="회원가입하기">
	</form>
</body>
</html>