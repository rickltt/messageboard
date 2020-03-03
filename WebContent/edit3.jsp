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
        <h1>留言板块:</h1>
			<table border="1">
				<%
				// 设置请求编码				
				request.setCharacterEncoding("utf-8");				
				// 设置响应编码				
				response.setContentType("utf-8");				
				int r_id = Integer.valueOf(request.getParameter("r_id"));			
				int m_id = Integer.valueOf(request.getParameter("m_id"));	
				UserLoginDao loginDao = new UserLoginDao();

			    
				ArrayList<reply> al = loginDao.findreplyById(r_id);
				%>
				
				<% 
			
							if (al != null) {
								Iterator iter = al.iterator();
								while (iter.hasNext()) {
									reply r = (reply) iter.next();
				%>
				<tr>
					<th>留言标题</th>
					<th>留言内容</th>
					<th>留言时间</th>
					<th>留言人ID</th>
				
				
					
				</tr>
				<tr>
					<td><%=r.getTitle()%></td>
					<td><%=r.getContent()%></td>
					<td><%=r.getTime()%></td>
					<td><%=loginDao.getUserNameById(r.getU_id())%></td>
					
				</tr>
				<% 
					}
							}
					%>
				<br>	
			
		
							

			</table>
	</div>
	<div style="text-align: center; margin-top: 140px">

        
		<h2 style="margin-left: 15%">请编辑</h2>
		
	
		<form action="updateReply.jsp" method="post">
			<table style="margin-left: 37%" border="1">
				
				<tr>
					<td>留言标题</td>
					<td><input type="text" name="title" /></td>
					<td>留言标题</td>
					<td><textarea name="message" rows="5" cols="35"></textarea></td>
				</tr>
			</table>
			 <input type="hidden" name="m_id" value="<%=m_id%>">
			 <input type="hidden" name="r_id" value="<%=r_id%>">
			<input type="submit" value="提交" /> <input type="reset" value="重置" />
		</form>
		<a href="main.jsp">返回留言板界面</a>
	</div>
</body>
</html>