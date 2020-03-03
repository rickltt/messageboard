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
 		int r_id = Integer.valueOf(request.getParameter("r_id"));								
 		// 调DB类中的方法判断是否插入成功				
 		if(new AdminLoginDao().DelReply(r_id)){					
 			response.sendRedirect("main.jsp") ;				
 			}
 	
    %>
	
		
	</div>

</body>
</html>