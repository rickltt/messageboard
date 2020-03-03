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
				int mb_id = Integer.valueOf(request.getParameter("mb_id"));			
				int m_id = Integer.valueOf(request.getParameter("m_id"));	
				UserLoginDao loginDao = new UserLoginDao();

			    
				ArrayList<message> al = loginDao.findMessageByid(m_id);
				%>
				
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
				
					
				</tr>
				<tr>
					<td><%=m.getTitle()%></td>
					<td><%=m.getContent()%></td>
					<td><%=m.getPublishtime()%></td>
					<td><%=loginDao.getUserNameById(m.getUserId())%></td>
					
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
		
	
		<form action="updateMessage.jsp" method="post">
			<table style="margin-left: 37%" border="1">
				
				<tr>
					<td>留言标题</td>
					<td><input type="text" name="title" /></td>
					<td>留言标题</td>
					<td><textarea name="message" rows="5" cols="35"></textarea></td>
				</tr>
			</table>
			 <input type="hidden" name="m_id" value="<%=m_id%>">
			 <input type="hidden" name="mb_id" value="<%=mb_id%>">
			<input type="submit" value="提交" /> <input type="reset" value="重置" />
		</form>
		<a href="main.jsp">返回留言板界面</a>
	</div>
</body>
</html>