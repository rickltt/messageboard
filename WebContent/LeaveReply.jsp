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
		int m_id=Integer.parseInt(request.getParameter("m_id"));	
		// 建立留言表对应JavaBean对象，把数据封装进去				
		reply r=new reply();				
					
		r.setTitle(title);
		r.setContent(message);
		r.setTime(new Timestamp(System.currentTimeMillis()));
		r.setMB_id(mb_id);	
		r.setU_id(u.getId());
		r.setM_id(m_id);
				
					
		// 调DB类中的方法判断是否插入成功				
		if(new UserLoginDao().insert_reply(r)){					
			
		%>

		<a href="reply.jsp?m_id=<%=m_id%>&mb_id=<%=mb_id%>">留言成功</a>
	<%} %>

</body>
</html>