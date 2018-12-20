package com.icreon.login.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icreon.login.daoImpl.AccessLoginDAO;
import com.icreon.login.model.Login;

import java.math.BigInteger;

@Controller
public class LoginController {
	
	@RequestMapping("Welcome")
	public ModelAndView validateUser(@RequestParam("username")String username,@RequestParam("password")String password,HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Throwable
	{
		PrintWriter out = response.getWriter(  );
	    response.setContentType("text/html");
		ModelAndView mv=new ModelAndView();
		try
		{
			System.out.println(username);
			System.out.println(password);
			AccessLoginDAO login=new AccessLoginDAO();
			List<Object[]> list=login.authenticate_user(request.getParameter("username"),request.getParameter("password"));
			
			
		if(list.isEmpty())
		{
			out.println("<script type=\"text/javascript\">");  
  			out.println("alert('Incorrect username or password');");  
  			out.println("location='user_login';");
  			out.println("</script>");
			//mv.setViewName("user_login");
		}
		else
		{
			for(Object[] obj :list)
			{
			Login l=new Login();
			int userid=(Integer) obj[0];
			Long user_id=(long) userid;
			l.setUserid(user_id);
			l.setUsername(String.valueOf(obj[1]));
			l.setPassword(String.valueOf(obj[2]));
			
				
			
				if(l.getUsername().equalsIgnoreCase(username) && l.getPassword().equals(password.trim()))
				{
					session.setAttribute("user_id", l.getUserid());
				    session.setAttribute("username",l.getUsername() );
					mv.setViewName("test.jsp");
							
				}
		
			}
		}
		
		}
		catch (Exception e)
		{
			e.printStackTrace();
			
		}
		
		return mv;
	}

}
