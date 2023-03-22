<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	session.removeAttribute("login");	

	String cookieValue="";
	Cookie[] cookies = request.getCookies();
	
	for(int i = 0;cookies!=null && i < cookies.length;i++){
		Cookie c = cookies[i];
		if(c.getName().equals("userid")){
			cookieValue = c.getValue();
			break;
		}
	}
	pageContext.setAttribute("userid", cookieValue);
%>

<% session.removeAttribute("cm") ;%>

<form action="login-action.jsp" method="POST">
	<p>
	<input type="text" value="${cookie.userid.value }" name="userId" placeholder="ID 입력" required autofocus>
	${loginerr}
	</p>
	<p><input type="password" name="userPw" placeholder="PW 입력" required></p>
	<p><input type="checkbox" name="storeid" ${empty cookie.userid ? '' : 'checked' }>ID 저장</p>
	<p><input type="submit" value="로그인"></p>
</form>
<a href="createmember.jsp"><button>회원가입</button></a>




</body>
</html>