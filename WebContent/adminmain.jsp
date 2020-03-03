<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
    <%@page import="dao.*" %>
<%@page import="model.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div
		style="margin-left: 15%; margin-top: 100px; font-family: Microsoft YaHei">
		<h1 style="margin-left: 5%">这里是管理员主界面</h1>
			<table border="1">
				<caption>所有用户信息</caption>
				<tr>
			
					<th>用户名</th>
					<th>用户密码</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>电话</th>
					<th>个性签名</th>
					<th>注销用户</th>
				</tr>
				<%
					admin a=(admin) request.getSession().getAttribute("adminlogin");
					AdminLoginDao loginDao = new AdminLoginDao();
					ArrayList<user> al = loginDao.findAllUser();					
					if (al != null) {
								Iterator iter = al.iterator();
								while (iter.hasNext()) {
									user u = (user) iter.next();
				%>
				<tr>
					<td><%=u.getName()%></td>
					<td><%=u.getPassword()%></td>
					<td><%=u.getSex()%></td>
					<td><%=u.getEmail()%></td>
					<td><%=u.getTelephone()%></td>
					<td><%=u.getSignature() %></td>
					<td><a href="dodelUser.jsp?u_id=<%=u.getId()%>">注销</a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</form>
		
	</div>
	
	<div
		style="margin-left: 15%; margin-top: 100px; font-family: Microsoft YaHei">
		<h1 style="margin-left: 5%">这里是用户注册时间日志</h1>
			<table border="1">
				<caption>所有用户信息</caption>
				<tr>
					<th>用户日志</th>
					<th>用户注册时间</th>
					
				</tr>
				<%
				     
					ArrayList<logs> all = loginDao.findAllLogs();		
					if (all != null) {
								Iterator iter = all.iterator();
								while (iter.hasNext()) {
									logs l = (logs) iter.next();
				%>
				<tr>
					<td><%=l.getLogs()%></td>
					<td><%=l.getTime()%></td>
					
					
				</tr>
				<%
					}
					}
				%>
			</table>
		</form>
		<a style="margin-left: 22%" href="adminmain1.jsp">留言管理</a>
		<a style="margin-left: 22%" href="login.jsp">退出</a>
	</div>

</body>
</html>