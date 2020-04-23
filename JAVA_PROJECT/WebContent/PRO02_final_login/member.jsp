<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function idCheck(id){
		frm = document.regFrm; // 밑에 form을 읽어올 수 있는 객체
		if(id == "")
		{
			alert("아이디를 입력해 주세요");
			frm.id.focus(); //frm form의 id창에 커서를 깜빡이게 한다
			return;
		}
		url="idCheck.jsp?id="+id; //id중복확인하는 페이지로 id을 넘김.
		window.open(url, "IDCheck", "width=300, height=150");
	}
	
	function zipCheck(){
		url = "zipSearch.jsp?check=n";
		window.open(url, "ZipCodeSearch", "width=500, height=300, scrollbars=yes");
		
	}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form name="regFrm" method="post" action="memberProc.jsp"> <!-- document.regFrm -->
		회원가입<p/>
		아이디 : <input name="id" size="15"> <input type="button" value="ID중복확인" onClick="idCheck(this.form.id.value)"><p/>
		<!-- this.form.id.value : input id에 사용자가 적은 값을 뜻한다 -->
		비밀번호 : <input name="pwd" type="password" size="15"><p/>
		비밀번호 확인 : <input name="repwd" type="password" size="15"><p/>
		이름 : <input name="name" size="15"><p/>
		성별 : 남성<input type="radio" name="gender" value="1" checked="checked"> 여성<input type="radio" name="gebder" value="2"><p/>
		생년월일 : <input name="birthday" size="6"> 예) 1998년 09월 05일 -> 980905<p/> 
		이메일 : <input name="email" size="30"><p/>
		우편번호 : <input name="zipcode" size="5"><p/>
		주소 : <input name="address" size="45"><p/>
		취미
		인터넷<input type="checkbox" name="hobby" value="인터넷">
		여행<input type="checkbox" name="hobby" value="여행">
		게임<input type="checkbox" nane="hobby" value="게임"><p/>
		직업 :
		<select name="job">
			<option value="0" selected>선택하세요.
			<option value="회사원">회사원
			<option value="연구전문직">연구전문직
			<option value="교수학생">교수학생
			<option value="공무원">공무원
			<option value="백수알바생">백수알바생 <p/>
		</select>
		<input type="button" value="회원가입" onclick="inputCheck()"> <!-- script.js에 있는 함수 호출. 빈칸이 없는지 체크한다 -->
		<input type="reset" value="다시쓰기"><p/>
		<input type="button" value="로그인하러가기" onclick="javascript:location.href='login.jsp'">
	</form>

</body>
</html>