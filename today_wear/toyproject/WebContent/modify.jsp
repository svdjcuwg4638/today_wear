<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form action="modify-action.jsp" method="POST">
	<p>
		<input type="text" name="userId" value="${login.userId }" readonly >
	</p>

	<p><input type="password" name="userPw" value="${login.userPw }" required></p>
	<p><input type="text" name="name" value="${login.name }" required></p>
	<p><input type="number" name="age" min="0" value="${login.age }" required></p>
	<p>
		<span>
			<input type="radio" name="gender" value="남" 
			${login.gender == '남' ? 'checked' : ''}>남
		</span>
		<span>
			<input type="radio" name="gender" value="여" 
			${login.gender == '여' ? 'checked' : ''}>여
			
		</span>
	</p>
	<select name="location" required>
		<option ${login.location == '부산' ? 'selected' : '' } >부산</option>
		<option ${login.location == '서울' ? 'selected' : '' } >서울</option>
		<option ${login.location == '울산' ? 'selected' : '' } >울산</option>
	</select>
	<p><input type="submit" value="회원 수정"></p>
</form>

</body>
</html>