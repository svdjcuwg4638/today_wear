<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="user" class="toyproject.ToyMemberDTO"/>
<jsp:setProperty property="*" name="user"/>

<%
	int row = dao.insert(user);

	if(row==0){
		session.setAttribute("idcheck", "ID가 중복됩니다.");
		response.sendRedirect("createmember.jsp");
	}
	else{
		session.removeAttribute("idcheck");
		session.setAttribute("cm",user);
		response.sendRedirect("cmfinish.jsp");
	}
%>

</body>
</html>