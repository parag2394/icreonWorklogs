package com.icreon.util;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController 
{
	
	@RequestMapping("/home")
	public ModelAndView home_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("index.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView login_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("login.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	
	
	@RequestMapping("/approvedWorklogs")
	public ModelAndView approved_worklogs_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("approvedWorklogs.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	

	@RequestMapping("/unApprovedWorklogs")
	public ModelAndView unApproved_worklogs_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("unApprovedWorklogs.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/rejectedWorklogs")
	public ModelAndView rejected_worklogs_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("rejectedWorklogs.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/serachWorklogs")
	public ModelAndView search_worklogs_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("new_worklogs.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	

	
	@RequestMapping("/logout")
	public ModelAndView logout_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("logout.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/deviceLook")
	public ModelAndView deviceLook_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("deviceLook.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/pageNotFound")
	public ModelAndView pageNotFound_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("notFound.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	
	
	
	@RequestMapping("/unauthorized")
	public ModelAndView unauthorizedAccess_controller()
	{
		ModelAndView mv=new ModelAndView();
		try
		{
			mv.setViewName("unauthorized.jsp");
		}
		catch (Exception e) 
		{
			mv.setViewName("serverNotReachable.jsp");
		}
		return mv;
	}
	
	
	
	
}
