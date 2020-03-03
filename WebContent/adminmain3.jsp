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
		style="margin-left: 15%; margin-top: 100px; font-family: Microsoft YaHei">
		<h1 style="margin-left: 5%">楼主留言：</h1>
			<table border="1">
				<caption>所有回复信息</caption>
				<%
				request.setCharacterEncoding("utf-8");				
		 		// 设置响应编码				
		 		response.setContentType("utf-8");				
		 				
		 		// 获取message内容				
		 		int M_id = Integer.valueOf(request.getParameter("m_id"));	
				session.setAttribute("m_id", M_id);
				
				UserLoginDao loginDao = new UserLoginDao();
				ArrayList<message> all = loginDao.findMessageByid(M_id);
				%>
				
				<%     
							
							if (all != null) {
								Iterator iter = all.iterator();
								while (iter.hasNext()) {
									message m = (message) iter.next();
				%>
				<tr>
					<th>楼主标题</th>
					<th>楼主留言</th>
					<th>楼主留言时间</th>
					
					
					
				</tr>
				<tr>
					<td><%=m.getTitle()%></td>
					<td><%=m.getContent()%></td>
					<td><%=m.getPublishtime()%></td>
					
					
					
				</tr>
				<% }
					}%>
				<br>	
			
		

								
			
			</table>
		
		
	</div>
<div
		style="margin-left: 15%; margin-top: 100px; font-family: Microsoft YaHei">
		

		<h2>所有回复信息</h2>
			<table border="1">
				
				<%
			
				ArrayList<reply> al = loginDao.findreply(M_id);
				%>
				
				<%     
							
							if (al != null) {
								Iterator iter = al.iterator();
								while (iter.hasNext()) {
									reply r = (reply) iter.next();
				%>
				<tr>
					<th>回复留言标题</th>
					<th>回复留言内容</th>
					<th>回复留言时间</th>
					<th>回复留言人</th>
					<th>删除</th>
					
				</tr>
				<tr>
					<td><%=r.getTitle()%></td>
					<td><%=r.getContent()%></td>
					<td><%=r.getTime()%></td>
					<td><%=loginDao.getUserNameById(r.getU_id())%></td>
					<td><a href="admindodel3.jsp?r_id=<%=r.getId()%>">删除</a></td>
					
				</tr>
				<% }
					}%>
				<br>	
			
		

								
			
			</table>
		
		<a style="margin-left: 12%" href="adminmain1.jsp">退出</a>
	</div>

</body>
</html>