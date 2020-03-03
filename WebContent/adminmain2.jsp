<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="model.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
<div
		style="margin-left: 35%; margin-top: 100px; font-family: Microsoft YaHei">
	
		
		
		
			<table border="1">
				<caption>所有留言信息</caption>
				<%
				// 设置请求编码				
				request.setCharacterEncoding("utf-8");				
				// 设置响应编码				
				response.setContentType("utf-8");				
						
				// 获取message内容				
				int mb_id = Integer.valueOf(request.getParameter("mb_id"));	
					UserLoginDao loginDao = new UserLoginDao();
					AdminLoginDao loginDao1 = new AdminLoginDao();
			    session.setAttribute("mb_id", mb_id); 
				ArrayList<message> al = loginDao1.findMessage(mb_id);
				%>
				<h1>欢迎来到《<%=loginDao.getMbName(mb_id) %>》留言板块</h1>
				<% 
			
							if (al != null) {
								Iterator iter = al.iterator();
								while (iter.hasNext()) {
									message m = (message) iter.next();
				%>
				<tr>
					<th>留言标题</th>
					<th>留言内容</th>
					<th>留言时间</th>
					<th>留言人ID</th>
					<th>回复信息</th>
					<th>删除</th>
				</tr>
				<tr>
					<td><%=m.getTitle()%></td>
					<td><%=m.getContent()%></td>
					<td><%=m.getPublishtime()%></td>
					<td><%=loginDao.getUserNameById(m.getUserId())%></td>
					<td><a href="adminmain3.jsp?m_id=<%=m.getId()%>">查看</a></td>
					<td><a href="admindodel2.jsp?m_id=<%=m.getId()%>">删除</a></td>
				</tr>
				<% }
							}
					%>
				<br>	
			
		
							

			</table>
			<a style="margin-left: 12%" href="adminmain1.jsp">退出</a>
	</div>
	
</body>
</html>