<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<form action="createmember-action.jsp">
	
	
	<p>
		<input type="text" name="userId" placeholder="Id입력" required autofocus>
			${idcheck }
	</p>

	
	<p><input type="password" name="userPw" placeholder="PW입력" required></p>
	<p><input type="text" name="name" placeholder="이름 입력" required></p>
	<p><input type="number" name="age" min="0" placeholder="나이 입력" required></p>
	<p>
		<span><input type="radio" name="gender" value="남" required>남</span>
		<span><input type="radio" name="gender" value="여">여</span>
	</p>
	<select name="location" required>
		<option>부산</option>
		<option>서울</option>
		<option>울산</option>
	</select>
	<p><input type="submit" value="회원가입 신청"></p>
</form>
</body>
</html>