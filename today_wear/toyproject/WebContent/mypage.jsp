<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const mypagecheck = ${empty login}
	
	if(mypagecheck){
		alert('먼저 로그인 후 이용 가능한 기능입니다.')
		location.href = '${cpath}/index.jsp'
					
	}
</script>

<div>${login.name }님의 마이페이지</div>

<div>이름:${login.name }</div>
<div>아이디 :${login.userId }</div>
<div>비밀번호 : *******</div>
<div>나이	: ${login.age }</div>
<div>성별: ${login.gender }	</div>
<div>지역	: ${login.location }</div>
<div></div>
<p><a href="modify.jsp"><button>회원 수정</button></a></p>
<p><a href="delete.jsp"><button>회원 탈퇴</button></a></p>



</body>
</html>