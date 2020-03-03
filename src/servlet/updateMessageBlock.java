package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserLoginDao;
import model.*;


@WebServlet("/updateMessageBlock")
public class updateMessageBlock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateMessageBlock() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置请求编码				
		request.setCharacterEncoding("utf-8");				
		// 设置响应编码				
		response.setContentType("utf-8");							
		// 获取message内容				
		String newtitle=request.getParameter("title");				
		int mbId=(int) request.getSession().getAttribute("mb_id");
		
		// 建立留言表对应JavaBean对象，把数据封装进去				
				
					
		// 调DB类中的方法判断是否插入成功				
		if(new UserLoginDao().update_MB(newtitle, mbId)){					
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
