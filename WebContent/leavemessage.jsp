<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="model.*" %>
<%@page import="java.sql.Timestamp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  	// 设置请求编码				
		request.setCharacterEncoding("utf-8");				
		// 设置响应编码				
		response.setContentType("utf-8");				
		// 获取title内容				
		String title=request.getParameter("title");				
		// 获取message内容				
		String message=request.getParameter("message");	
		user u=(user) request.getSession().getAttribute("login");
		int mb_id=Integer.parseInt(request.getParameter("mb_id"));
		message m=new message();				
		
		m.setTitle(title);
		m.setContent(message);
		m.setPublishtime(new Timestamp(System.currentTimeMillis()));
		m.setMb_id(mb_id);			
		m.setUserId(u.getId());			
					
		// 调DB类中的方法判断是否插入成功				
		if(new UserLoginDao().insert_message(m)){					
			
		%>

		<a href="message.jsp?mb_id=<%=mb_id%>">留言成功</a>
	<%} %>

</body>
</html>