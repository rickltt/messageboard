package servlet;

import java.io.IOException;



import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserLoginDao;
import model.*;



@WebServlet("/addMessageBlockServlet")
public class addMessageBlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public addMessageBlockServlet() {
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
		String MB_name=request.getParameter("title");				
					
		// 从session中取出当前用户对象				
		user amb=(user) request.getSession().getAttribute("login");				
		// 建立留言表对应JavaBean对象，把数据封装进去				
		MessageBlock mb=new MessageBlock();				
					
		// 参数为获取的当前时间				
		mb.setMBName(MB_name);				
		mb.setMBtime(new Timestamp(System.currentTimeMillis()));				
		mb.setUserId(amb.getId());				
		// 调DB类中的方法判断是否插入成功				
		if(new UserLoginDao().addInfo(mb)){					
			response.sendRedirect("success.jsp") ;				
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
