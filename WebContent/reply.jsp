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
		 				
		 		
				int m_id=Integer.parseInt(request.getParameter("m_id"));
				int mb_id=Integer.parseInt(request.getParameter("mb_id"));
				user u=(user) request.getSession().getAttribute("login");
				int pagesize=3; 
				int showPage=1;
				String strPage = null;
			 	//获取目的界面
			 	strPage = request.getParameter("showPage");
			 	if(strPage == null){
			 	showPage = 1;
			 	}
			 	else{
			 	
			 		try{
			 			showPage=Integer.parseInt(strPage);
			 			}
			 			catch(NumberFormatException e){
			 			
			 			showPage = 1;
			 			}
			 			if(showPage<1){
			 			
			 			showPage=1;
			 	}
			 	}
				int line=(showPage-1)*pagesize;
				
				
				UserLoginDao loginDao = new UserLoginDao();
				ArrayList<message> all = loginDao.findMessageByid(m_id);
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
					}
					
				int getRowCount=loginDao.counts_r(m_id);
				int getPageCount=0;
				if(getRowCount%pagesize==0){
					getPageCount=getRowCount/pagesize;
				}
				else{
					getPageCount=getRowCount/pagesize+1;
				}%>
				<br>	
	
			</table>
		
		
	</div>
<div
		style="margin-left: 15%; margin-top: 100px; font-family: Microsoft YaHei">
		

		<h2>所有回复信息</h2>
			<table border="1">
				
				<%
			
				ArrayList<reply> al = loginDao.findreply(m_id,line,pagesize);	
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
					<th>编辑</th>
					
				</tr>
				<tr>
					<td><%=r.getTitle()%></td>
					<td><%=r.getContent()%></td>
					<td><%=r.getTime()%></td>
					<td><%=loginDao.getUserNameById(r.getU_id())%></td>
					<%if(loginDao.getUserNameById(r.getU_id()).equals(u.getName())){ %>
					<td><a href="userdodel2.jsp?r_id=<%=r.getId()%>">删除</a></td>
					<td><a href="edit3.jsp?r_id=<%=r.getId()%>&m_id=<%=m_id%>">编辑</a></td>
					
				</tr>
				<% }
								}
					}%>
				<br>	
			
		

								
			
			</table>
		<form action="reply.jsp.jsp" method="get" target="_self">
	    	共<font color = red><%=getRowCount%></font>条&nbsp;
	    	<%=pagesize%>条/页&nbsp;
	    	第<font color = red><%=showPage%></font>页/共
	    	<font color = red><%=getPageCount%></font>页&nbsp;
	    	<a href="reply.jsp?showPage=1&m_id=<%=m_id%>&mb_id=<%=mb_id%>"target="_self">[首页]</a>&nbsp;
	    	<%
	    		//判断“上一页”链接是否要显示
	    		if(showPage>1){
	    		
	    	 %>
	    			<a href="reply.jsp?showPage=<%=showPage-1%>&m_id=<%=m_id%>&mb_id=<%=mb_id%>" target="_self">[上一页]</a>&nbsp;
	    				
	    				<%
	    				}else{ 
	    				%>
	    					[上一页]
	    	
	    	<%
    	} 
    	//判断下一页链接是否要显示
			if(showPage<getPageCount)
			{    	
    	%>
    	
    	<a 
    		href="reply.jsp?showPage=<%=showPage+1%>&m_id=<%=m_id%>&mb_id=<%=mb_id%>"
    		 target="_self">[下一页]</a>
    		&nbsp;
    	
    	<%
    	}else{
    	 %>
    	 [下一页]&nbsp;
    	 <%
    	 } 
    	 %>
    	 <a href="reply.jsp?showPage=<%=getPageCount%>&m_id=<%=m_id%>&mb_id=<%=mb_id%>"
    	 	target="_self">[尾页]</a>&nbsp;
    	 	
    	 	转到
    	 	<select name = "showPage">
    	 	<% 
    	 		for(int x = 1;x <= getPageCount;x++){
    	 		  
    	 	 %>
    	 	 <option value="<%=x %>"<%if(showPage==x)
    	 	 		out.println("selected");%>>
    	 	 		<%=x %></option>
    	 	 		
    	 	 		<%
    	 	 		
    	 		
    	 	 		}
    	 	
    	 	 		 %>
    	 	 </select>
    	 	 
    	 	 页&nbsp;
    	 	 <input type="hidden" name="m_id" value="<%=m_id%>">
    	 	 <input type="submit" name="go" value="提交"/>
    	 	 
    	</form>
		
	</div>
<div style="text-align: center; margin-top: 140px">
		<h1 style="margin-left: 15%">回复信息</h1>
	
		
		<form action="LeaveReply.jsp" method="post">
			<table style="margin-left: 37%" border="1">
				<caption>填写回复信息</caption>
				<tr>
					<td>回复标题</td>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr>
					<td>回复内容</td>
					<td><textarea name="message" rows="5" cols="35"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="提交" /> 
			<input type="hidden" name="m_id" value="<%=m_id%>">
			<input type="hidden" name="mb_id" value="<%=mb_id%>"><input type="reset" value="重置" />
		</form>
		<a href="main.jsp">返回留言板界面</a>
	</div>
</body>
</html>