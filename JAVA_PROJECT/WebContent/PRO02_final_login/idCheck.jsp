<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<jsp:useBean id="mMgr" class="pro02.MemberMgr"/>

<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id %>는
	<%
	if(result)
	{
		out.println(" 이미 존재하는 ID입니다.<p/>");
	}
	else{
		out.println(" 사용가능한 아이디입니다. <p/>");
	}
	%>
	<a href="#" onclick="self.close()">닫기</a>
</body>
</html>