<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>

<%@page import="dao.*" %>
<%@page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div
		style="margin-left: 15%; margin-top: 100px; font-family: Microsoft YaHei">
		<h1 style="margin-left: 5%">这里是留言板主界面</h1>
		<%admin a=(admin) request.getSession().getAttribute("adminlogin"); %>
		<h2>欢迎您，<%=a.getName() %>管理员</h2>
			<table border="1">
				<caption>所有留言信息</caption>
				<tr>
					
					<th>留言标题</th>
					<th>留言和回复条数</th>
					<th>留言时间</th>
					<th>留言人ID</th>
					<td>进入</td>
					<td>删除</td>
					
				</tr>
				<br>
				<br>
				
				<%
					AdminLoginDao loginDao = new AdminLoginDao();
					ArrayList<MessageBlock> al = loginDao.findMbInfo();					
							if (al != null) {
								Iterator iter = al.iterator();
								while (iter.hasNext()) {
									MessageBlock mb = (MessageBlock) iter.next();
				%>
				<br>
				<tr>
					
					<td><%=mb.getMBName()%></td>
					<td><%=loginDao.getNumber(mb.getMBId())%></td>
					<td><%=mb.getMBtime()%></td>
					<td><%=loginDao.getUserNameById(mb.getUserId())%></td>
					<td><a href="adminmain2.jsp?mb_id=<%=mb.getMBId()%>">点击进入</a></td>
					<td><a href="admindodel1.jsp?mb_id=<%=mb.getMBId()%>">删除</a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		
		
		<a style="margin-left: 12%" href="adminmain.jsp">退出</a>
	</div>

</body>
</html>