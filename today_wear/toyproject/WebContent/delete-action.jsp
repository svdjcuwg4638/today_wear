<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<% 
	ToyMemberDTO dluser= (ToyMemberDTO) session.getAttribute("login");
	int row = dao.delete(dao.selectOne(dluser.getUserId()));
	session.removeAttribute("login");
	response.sendRedirect("index.jsp");
%>

</body>
</html>