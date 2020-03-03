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
				user u=(user) request.getSession().getAttribute("login");		
				// 获取message内容				
				int mb_id = Integer.valueOf(request.getParameter("mb_id"));	
				UserLoginDao loginDao = new UserLoginDao();
			    session.setAttribute("mb_id", mb_id); 
				ArrayList<MessageBlock> al = loginDao.findMbInfoById(mb_id);	
				%>
				
				<% 
			
							if (al != null) {
								Iterator iter = al.iterator();
								while (iter.hasNext()) {
									MessageBlock mb = (MessageBlock) iter.next();
				%>
				<tr>
					<th>板块名</th>
					<th>板块留言和回复条数</th>
					<th>留言时间</th>
					<th>留言人ID</th>
				
					
				</tr>
				<tr>
					<td><%=mb.getMBName()%></td>
					<td><%=loginDao.getNumber(mb.getMBId())%></td>
					<td><%=mb.getMBtime()%></td>
					<td><%=loginDao.getUserNameById(mb.getUserId())%></td>
					
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
		
	
		<form action="updateMessageBlock" method="post">
			<table style="margin-left: 37%" border="1">
				
				<tr>
					<td>留言标题</td>
					<td><input type="text" name="title" /></td>
				</tr>
			</table>
			<input type="submit" value="提交" /> <input type="reset" value="重置" />
		</form>
		<a href="main.jsp">返回留言板界面</a>
	</div>
</body>
</html>