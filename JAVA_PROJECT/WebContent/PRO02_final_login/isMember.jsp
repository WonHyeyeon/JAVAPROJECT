<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, pro02.*" %>
<!-- 지금 입력한 회원이 db에 있는지 확인하고, 있다면 successLogin.jsp 실패한다면 login.jsp로 이동
	pool을 이용하여 db에 접근한다 -->
<%
	DBConnectionMgr pool = DBConnectionMgr.getInstance(); //db 연결 풀 객체를 받는다.
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	System.out.println("hhh");
	String query = "";
	query = "select * from tblmember where id = '" + id + "' and pwd = '" + pwd + "';";
	try{
		conn = pool.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
		if(rs.next()){ //회원정보가 존재한다면
			System.out.println("aahhh");
			Cookie cookie = new Cookie("login", id);
			cookie.setMaxAge(60*2); //쿠키 지속시간 : 2분
			response.addCookie(cookie);
%>
	<script>
		alert("환영합니다");
		location.href="successLogin.jsp";
	</script>
<%
		} //if(rs.next()) end
		else{ //회원정보가 존재하지 않는다면
%>
	<script>
		alert("회원정보가 존재하지 않습니다. 다시 시도해주세요");
		location.href="login.jsp";
	</script>
<%
		}
%>
<%
	}//try end
	catch(Exception ex){
		System.out.println("error : " + ex);
	}
%>