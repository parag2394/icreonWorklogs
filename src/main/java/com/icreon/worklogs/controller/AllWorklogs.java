package com.icreon.worklogs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.icreon.GetWorklogs;
import com.icreon.worklogs.daoImpl.WorklogsDaoImpl;


@Controller
public class AllWorklogs {
	
	String username="rohit@icreon.com";
	   
    String password="Rrp@1993";
    
    List<Object[]> obj=null;
    
    @PostMapping("/getAllIssuesInProject")
    public void getIssues(@RequestParam(value="projects") String jql,
    		HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException{
    	 final String issueUri = "https://icreontech.atlassian.net/rest/api/2/"+"search?jql=project="+jql;
    	 System.out.println("Final String is = " +issueUri);
  
    	 response.setCharacterEncoding("UTF-8");
         PrintWriter out = response.getWriter();
    	 
         RestTemplate restTemplate = new RestTemplate();
         restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
         String output=restTemplate.getForObject(issueUri,String.class);
         System.out.println("output : "+output);

        JSONObject object = new JSONObject(output);
        Object issue1= object.get("issues");

        JSONArray array2 = (JSONArray)issue1;
        ArrayList issuList = new ArrayList();
       // ArrayList summaryuList = new ArrayList();
        for (int i=0; i< array2.length(); i++){

          //  System.out.println(array2.getJSONObject(i).get("key"));
            issuList.add(array2.getJSONObject(i).get("key"));
        }

       
        Collections.sort(issuList);
        
        Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(issuList);
		out.write(element.toString());
    	
    }
    
	 @RequestMapping("/getSelectedWorklogs")
		public ModelAndView getMetaDataListDetails(
				@RequestParam("issues")String issue,
				@RequestParam("user")String user,
				@RequestParam("FromDate")String fromDate,
				@RequestParam("ToDate")String toDate,
				HttpServletRequest request,
				HttpServletResponse response
				) throws Throwable
		{
		  PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			ModelAndView mv=new ModelAndView();
			System.out.println("From Date is"+fromDate);
			System.out.println("To Date is"+toDate);
			
			if(!issue.equals("0"))
	        {
	        	//WorklogsDaoImpl wd=new WorklogsDaoImpl();
		      //  obj=wd.showSelectedWorklogs(issue);
				
				 if(!user.equals("0"))
			        {
					
			        	if(toDate.equals(" ") && fromDate.equals(" "))
			        	{
			        		WorklogsDaoImpl wd=new WorklogsDaoImpl();
				        	obj=wd.showSelectedWorklogsWrtUser(issue,user);
			        	}
			        	else if(fromDate !=null && fromDate!="" && toDate !=null && toDate !="" )
			    			{
			    				WorklogsDaoImpl wd=new WorklogsDaoImpl();
			    	        	obj=wd.showSelectedWorklogsWrtAll(issue,user,fromDate,toDate);
		    			   }
			        	else
			        	{
			        		 WorklogsDaoImpl wd=new WorklogsDaoImpl();
					        	obj=wd.showSelectedWorklogsWrtUser(issue,user);
			        	}
		            }
				 else
				 {
					 WorklogsDaoImpl wd=new WorklogsDaoImpl();
				     obj=wd.showSelectedWorklogs(issue);
				 }
		        
		        
            }
	        

	      
	       request.setAttribute("JSON_RESULT",obj);
	       

	        mv.setViewName("new_worklogs.jsp");
	      

			return mv;
	
	        
		}
	 
	 @GetMapping("/updateApproveStatus")
	    public void updateWorklogStatus(
	    		@RequestParam(value="project_id")String p_project_id,
	    		@RequestParam(value="worklog_id")String p_worklog_id,
	    		@RequestParam(value="issue_id")String p_issue_id,
	    		HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException{
		 System.out.println("Update Controller Called");
		 PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
	    
		 WorklogsDaoImpl wd=new WorklogsDaoImpl();
    	wd.updateSelectedWorklog(p_project_id, p_worklog_id, p_issue_id);
	        Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(1);
			out.write(element.toString());
	    	
	    }
	 
	 @PostMapping("/getAuthors")
	    public void getSelectedAuthors(
	    		@RequestParam(value="issue")String issue,
	    		HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException{
		 System.out.println("Authors Controller Called");
		 PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
	    
		 WorklogsDaoImpl wd=new WorklogsDaoImpl();
 	List l=wd.showSelectedAuthors(issue);
	        Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(l);
			out.write(element.toString());
	    	
	    }
	 
	 
	 @PostMapping("/approveAll")
	    public void approveAllWorklogs(
	    		@RequestParam(value="worklog_id")String worklog_id,
	    		HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException{
		 System.out.println("Approve All Controller Called");
		 PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
	    
		 WorklogsDaoImpl wd=new WorklogsDaoImpl();
	int approve_status=wd.approveAllWorklogs(worklog_id);
	
	        Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(approve_status);
			out.write(element.toString());
	    	
	    }

}
