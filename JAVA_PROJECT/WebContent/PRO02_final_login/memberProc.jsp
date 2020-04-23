<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="pro02.MemberMgr"/>
<jsp:useBean id="bean" class="pro02.Memberbean"/>
<jsp:setProperty property="*" name="bean"/>

<%
	boolean result = mgr.insertMember(bean);
	System.out.println("memberProc.jsp : " + result);
	String msg = "회원가입에 실패하였습니다.";
	String location = "member.jsp";
	if(result)
	{
		msg = "회원가입에 성공하셨습니다.";
		location = "login.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>
