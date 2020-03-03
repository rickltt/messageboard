<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="model.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div
		style="margin-left: 15%; margin-top: 100px; font-family: Microsoft YaHei">
		<h1 style="margin-left: 5%">搜索结果</h1>
		
		<%
		user u=(user) request.getSession().getAttribute("login");
		request.setCharacterEncoding("utf-8");				
		// 设置响应编码				
		response.setContentType("utf-8");
		String corp_name=request.getParameter("corp_name");%>
			<table border="1">
				<caption>所有留言信息</caption>
				<tr>
					
					<th>留言标题</th>
					<th>留言和回复条数</th>
					<th>留言时间</th>
					<th>留言人ID</th>
					<td>进入</td>
					
				</tr>
				<br>
				<br>
				
				<%
					UserLoginDao loginDao = new UserLoginDao();
					ArrayList<MessageBlock> al = loginDao.findMbInfoBySelect(corp_name);				
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
					<td><a href="messageblock.jsp?mb_id=<%=mb.getMBId()%>">点击进入</a></td>
					
				</tr>
				<%
					}
					}
				%>
			</table>
		
		<a href="usermessage.jsp?u_name=<%=u.getName()%>">我的信息</a>
		<a style="margin-left: 12%" href="addMessageBlock.jsp">创建留言板块</a>
		<a style="margin-left: 12%" href="main.jsp">退出</a>
	</div>
</body>
</html>