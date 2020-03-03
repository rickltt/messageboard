package servlet;

import java.io.IOException;

import java.sql.Timestamp;






import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserLoginDao;
import model.user;
import model.message;



@WebServlet("/LeaveMessage")
public class LeaveMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LeaveMessage() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置请求编码				
		request.setCharacterEncoding("utf-8");				
		// 设置响应编码				
		response.setContentType("utf-8");				
		// 获取title内容				
		String title=request.getParameter("title");				
		// 获取message内容				
		String message=request.getParameter("message");				
		// 从session中取出当前用户对象				
		user u=(user) request.getSession().getAttribute("login");
		int mbId=(int) request.getSession().getAttribute("mb_id");	
		// 建立留言表对应JavaBean对象，把数据封装进去				
		message m=new message();				
					
		m.setTitle(title);
		m.setContent(message);
		m.setPublishtime(new Timestamp(System.currentTimeMillis()));
		m.setMb_id(mbId);			
		m.setUserId(u.getId());			
					
		// 调DB类中的方法判断是否插入成功				
		if(new UserLoginDao().insert_message(m)){					
			response.sendRedirect("main.jsp") ;				
			}
		else {
			response.sendRedirect("error.jsp") ;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
