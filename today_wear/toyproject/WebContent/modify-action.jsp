<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="user" class="toyproject.ToyMemberDTO"/>
<jsp:setProperty property="*" name="user"/>

<%
	dao.modify(user);
	ToyMemberDTO ob = dao.selectOne(user.getUserId());
	session.setAttribute("login", ob);
	response.sendRedirect("modify-finish.jsp");
	
	
%>

</body>
</html>