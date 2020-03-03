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
 		int MBid = Integer.valueOf(request.getParameter("mb_id"));								
 		// 调DB类中的方法判断是否删除成功				
 		if(new AdminLoginDao().delmess_block(MBid)==1){					
 			response.sendRedirect("main.jsp") ;				
 			}
 		else{
 			response.sendRedirect("success1.jsp") ;
 		}
    %>
	
		
	</div>

</body>
</html>