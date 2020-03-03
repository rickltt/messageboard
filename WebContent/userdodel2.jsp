<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="dao.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div bgcolor="#ddd" style="margin-left: 42%; margin-top: 240px; font-family: Microsoft YaHei"">
    <%
 // 设置请求编码				
 		request.setCharacterEncoding("utf-8");				
 		// 设置响应编码				
 		response.setContentType("utf-8");				
 				
 		// 获取message内容				
 		int m_id = Integer.valueOf(request.getParameter("m_id"));
 		int mb_id = Integer.valueOf(request.getParameter("mb_id"));
 		// 调DB类中的方法判断是否插入成功				
 		if(new AdminLoginDao().DelMessage(m_id)){					
 			%>			
		<a href="message.jsp?mb_id=<%=mb_id%>">删除成功</a>
 			<% 		
 			}
 	
    %>
	
		
	</div>

</body>
</html>