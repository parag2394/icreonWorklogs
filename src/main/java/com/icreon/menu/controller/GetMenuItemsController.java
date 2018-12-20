package com.icreon.menu.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GetMenuItemsController {
	
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("index.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping("/user_login")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("login.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/show_department")
	public ModelAndView showAllDepartments(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("showDept.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/show_sub_department")
	public ModelAndView showAllSubDepartments(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("showSubDept.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/show_room_rack_shelfs")
	public ModelAndView showAllRoomRackShelfs(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("showRoomRackShelfs.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/show_list_of_list")
	public ModelAndView showAllListOfList(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("show_ListOfList.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/set_department")
	public ModelAndView setDepartment(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("deptInsert.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/set_sub_department")
	public ModelAndView setSubDepartment(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("subDeptInsert.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/set_room_rack_shelfs")
	public ModelAndView setRoomRackShelfs(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("room_Rack_Shelfs_Insert.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/set_list_of_list")
	public ModelAndView setListOfList(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("list_of_list.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/set_list_details")
	public ModelAndView setListDetails(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("list_detail_insert.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping("/under_construction")
	public ModelAndView undetConstruction(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		
		try 
		{
			mv.setViewName("under_construction.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
	

}
