<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String id = "";
		if(cookies!=null){
			for(int i = 0; i<cookies.length; i++)
			{
				if(cookies[i].getName().equals("login"))
				{	
					id = cookies[i].getValue();
				}
			}
		}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id %>님 환영합니다.<p/>
	로그아웃 하고 싶으시다면 <a href="logout.jsp">로그아웃</a>을 눌러주세요.<p/>
	
	</body>
</html>