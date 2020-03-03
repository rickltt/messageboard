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
	
		
		
		<table border="1">
			
				<caption>所有留言信息</caption>
				<%
				// 设置请求编码				
				request.setCharacterEncoding("utf-8");				
				// 设置响应编码				
				response.setContentType("utf-8");
				String strid=null;
				strid=request.getParameter("mb_id");
				int mb_id=Integer.valueOf(strid);
			
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
				// 获取message内容	
				
			
			
				UserLoginDao loginDao = new UserLoginDao();
			    
				ArrayList<message> al = loginDao.findMessage(mb_id,line,pagesize);	
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
					<th>回复条数</th>
					<th>回复信息</th>
					<th>删除</th>
					<th>编辑</th>
				</tr>
				<tr>
					<td><%=m.getTitle()%></td>
					<td><%=m.getContent()%></td>
					<td><%=m.getPublishtime()%></td>
					<td><%=loginDao.getUserNameById(m.getUserId())%></td>
					<td><%=loginDao.counts_r(m.getId()) %></td>
					<td><a href="reply.jsp?m_id=<%=m.getId()%>&mb_id=<%=mb_id%>">查看</a></td>
					<%if(loginDao.getUserNameById(m.getUserId()).equals(u.getName())){ %>
					<td><a href="userdodel2.jsp?m_id=<%=m.getId()%>&mb_id=<%=mb_id%>">删除</a></td>
					<td><a href="edit2.jsp?m_id=<%=m.getId()%>&mb_id=<%=mb_id%>">编辑</a></td>
					<%
					} %>
					
				</tr>
				<% 
					}
							}
				int getRowCount=loginDao.counts_m(mb_id);
				int getPageCount=0;
				if(getRowCount%pagesize==0){
					getPageCount=getRowCount/pagesize;
				}
				else{
					getPageCount=getRowCount/pagesize+1;
				}
					%>
				<br>	
			
		
							

			</table>
			<form action="message.jsp" method="get" target="_self">
	    	共<font color = red><%=getRowCount%></font>条&nbsp;
	    	<%=pagesize%>条/页&nbsp;
	    	第<font color = red><%=showPage%></font>页/共
	    	<font color = red><%=getPageCount%></font>页&nbsp;
	    	<a href="message.jsp?showPage=1&mb_id=<%=mb_id%>"target="_self">[首页]</a>&nbsp;
	    	<%
	    		//判断“上一页”链接是否要显示
	    		if(showPage>1){
	    		
	    	 %>
	    			<a href="message.jsp?showPage=<%=showPage-1%>&mb_id=<%=mb_id%>" target="_self">[上一页]</a>&nbsp;
	    				
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
    		href="message.jsp?showPage=<%=showPage+1%>&mb_id=<%=mb_id%>"
    		 target="_self">[下一页]</a>
    		&nbsp;
    	
    	<%
    	}else{
    	 %>
    	 [下一页]&nbsp;
    	 <%
    	 } 
    	 %>
    	 <a href="message.jsp?showPage=<%=getPageCount%>&mb_id=<%=mb_id%>"
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
    	 	 <input type="hidden" name="mb_id" value="<%=mb_id%>">
    	 	 <input type="submit" name="go" value="提交"/>
    	 	 
    	</form>
	</div>
	
	<div style="text-align: center; margin-top: 140px">

        
		<h2 style="margin-left: 15%">请留言</h2>
		
	
		<form action="leavemessage.jsp" method="post">
			<table style="margin-left: 37%" border="1">
				<caption>填写留言信息</caption>
				<tr>
					<td>留言标题</td>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr>
					<td>留言内容</td>
					<td><textarea name="message" rows="5" cols="35"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="提交" />
			 <input type="hidden" name="mb_id" value="<%=mb_id%>"> <input type="reset" value="重置" />
		</form>
		<a href="main.jsp">返回留言板界面</a>
	</div>
</body>
</html>