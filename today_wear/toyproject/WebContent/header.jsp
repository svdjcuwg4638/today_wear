<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="toyproject.*" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="dao" value="${ToyMemberDAO.getInstance() }"/>
<% 
	pageContext.setAttribute("cpath", request.getContextPath());
	request.setCharacterEncoding("UTF-8");
	ToyMemberDAO dao = ToyMemberDAO.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>header</h1>


<hr>
