<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>

<jsp:useBean id="user" class="toyproject.ToyMemberDTO" scope="page" />
<jsp:setProperty property="*" name="user" />

<%
	String storeid = request.getParameter("storeid");
	ToyMemberDTO login = dao.login(user);
	
	// 쿠키 생성 로그인 실패 성공 상관없이 체크만 한다면 생성
	
	Cookie cookie = new Cookie("userid",user.getUserId());
	cookie.setMaxAge(storeid !=null ? 60*60*24 : 0);
	response.addCookie(cookie);
	
	if(login ==null){
		// 로그인실패시 로그인에러라는 세션생성 내용은 밑과같음 실패했을때만 출력하게 index에 설정해놓음
		session.setAttribute("loginerr", "ID혹은 PW가 틀렸습니다.");
		response.sendRedirect("index.jsp");
		}
	else{
		// 성공시 로그인 에러 삭제 세션에 로그인 데이터 저장
		session.removeAttribute("loginerr");
		session.setAttribute("login", login);
		response.sendRedirect("main.jsp");
	}
	
%>



</body>
</html>