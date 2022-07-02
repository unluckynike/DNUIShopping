package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Category;
import model.Goods;
import model.User;
import service.HomeService;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns ={"/index.action","/login.action","/logout.action","/reg.action"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();		
		if(url.equals("/index.action")){	
			
			List<Map<String,String>> list = HomeService.getTodayGoodsList();
		    request.setAttribute("todaylist", list);
		    
		    List<Category> catelist = HomeService.getcateList();
		    request.setAttribute("catelist", catelist);
		    
		    List<Goods> hostlist = HomeService.getHotGoodsList();
		    request.setAttribute("hostlist", hostlist);

			request.getRequestDispatcher("/home.jsp").forward(request, response);		    
		}
		else if(url.equals("/login.action")){
			response.setContentType("text/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			String username= request.getParameter("userName");
			String password=request.getParameter("userPass");
//			int num=HomeService.getCheckUser(username,password);
			User loginuser=new User();
			loginuser=HomeService.getCheckUser(username, password);
			
			if(loginuser!=null){
				request.getSession().setAttribute("_LOGIN_USER_",loginuser);
				out.print("{\"login\":true,\"username\":\""+username+"\"}");
			}else{
				out.print("{\"login\":false,\"msg\":\"ÓÃ»§Ãû»òÃÜÂë´íÎó\"}");
			}
			System.out.println("µÇÂ¼");
			out.flush();
		}else if(url.equals("/logout.action")){
			request.getSession().removeAttribute("_LOGIN_USER_");
			System.out.println("ÍË³öµÇÂ¼");
			
		}else if(url.equals("/reg.action")){
			response.setContentType("text/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			String username=request.getParameter("userName");
			String password=request.getParameter("userPass");
		
			int i=HomeService.regUser(request.getParameterMap());
			System.out.println("×¢²á");
			if(i>=1){
			  User loginuser=new User();
			  loginuser.setUserName(username);
			  request.getSession().setAttribute("_LOGIN_USER_",loginuser);	
			  out.print("{\"reg\":true,\"username\":\""+username+"\"}");
		    }else{
			   out.print("{\"reg\":false}");
		    }
			
			out.flush();
		}

	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
