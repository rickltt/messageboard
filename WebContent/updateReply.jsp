<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="model.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%// 设置请求编码				
request.setCharacterEncoding("utf-8");				
// 设置响应编码				
response.setContentType("utf-8");							
// 获取message内容				
String newtitle=request.getParameter("title");	
String newmessage=request.getParameter("message");	
int m_id=Integer.parseInt(request.getParameter("m_id"));
int r_id=Integer.parseInt(request.getParameter("r_id"));
if(new UserLoginDao().update_r(newtitle, newmessage, r_id)){
%><a href="reply.jsp?m_id=<%=m_id%>">修改完成</a>

<%} %>
</body>
</html>