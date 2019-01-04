package com.icreon.worklogs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.icreon.login.model.Login;
import com.icreon.worklogs.boImpl.WorkLogBoImpl;
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
import com.icreon.worklogs.daoImpl.WorklogsDaoImpl;

import static com.icreon.util.ApplicationConstants.ICREONJIRA_URL;


@Controller
public class AllWorklogs {

    List<Object[]> obj=null;
    
    @PostMapping("/getAllIssuesInProject")
    public void getIssues(@RequestParam(value="projects") String jql,
    		HttpServletRequest request,
			HttpServletResponse response) throws JSONException, IOException{

    	 final String issueUri = ICREONJIRA_URL  +"search?jql=project="+jql;
    	 System.out.println("Final String is = " +issueUri);

    	 HttpSession session = request.getSession();

    	 String username = (String) session.getAttribute("username");
    	 String password = (String) session.getAttribute("password");

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

       
        Collections.reverse(issuList);
        
        Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(issuList);
		out.write(element.toString());
		out.flush();
		out.close();
    	
    }
    
	 @RequestMapping("/getSelectedWorklogs")
		public ModelAndView getMetaDataListDetails(
			 @RequestParam("projects")String projects,
				@RequestParam("issues")String issue,
				@RequestParam("user")String user,
				@RequestParam("FromDate")String fromDate,
				@RequestParam("ToDate")String toDate,
				@RequestParam("status")int status,
				HttpServletRequest request,
				HttpServletResponse response
				) throws Throwable
		{
			System.out.println("Issue is "+issue);
			System.out.println("User is "+user);
			System.out.println("From Date is "+fromDate);
			System.out.println("To Date is "+toDate);
			System.out.println("Status is "+status);

			ModelAndView mv=new ModelAndView();

		  	PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");

			WorkLogBoImpl boImplObject = new WorkLogBoImpl();
			obj=boImplObject.getSelectedWorklogs(issue,user,fromDate,toDate,status);

	       request.setAttribute("JSON_RESULT",obj);

					/*if(issue==null || issue=="" ||user==null||user==""||fromDate==""||fromDate==null
					||toDate==""||toDate==null)
					{
						issue="";
						user="";
						fromDate="";
						toDate="";
					}*/

	        //mv.setViewName("new_worklogs.jsp?"+"issue="+issue+"&user="+user+"&fromDate="+fromDate+"&toDate="+toDate);
			mv.setViewName("new_worklogs.jsp?"+"projects="+projects+"&issue="+issue+"&user="+user);


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

    	WorkLogBoImpl boImplObject = new WorkLogBoImpl();
		boImplObject.gotoWorklogMethod(request,response,p_project_id,p_worklog_id,p_issue_id,"updateSelectedWorklog");

	    }

	 @GetMapping("/updateApproveStatusToReject")
	    public void updateWorklogStatusTO_REJECTED(
	    		@RequestParam(value="project_id")String p_project_id,
	    		@RequestParam(value="worklog_id")String p_worklog_id,
	    		@RequestParam(value="issue_id")String p_issue_id,
	    		HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException{

		 System.out.println("Update Controller Called");

		 WorkLogBoImpl boImplObject = new WorkLogBoImpl();
		 boImplObject.gotoWorklogMethod(request,response,p_project_id,p_worklog_id,p_issue_id,"updateSelectedWorklogStatusTORejected");

	    }
	 
	 @PostMapping("/getAuthors")
	    public void getSelectedAuthors(
	    		@RequestParam(value="issue")String issue,
	    		HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException{

    	System.out.println("Authors Controller Called");

		 WorkLogBoImpl boImplObject = new WorkLogBoImpl();
		 boImplObject.gotoSingleParamWorklogMethod(request,response,issue,"showSelectedAuthors");

	    }
	 
	 
	 @PostMapping("/approveAll")
	    public void approveAllWorklogs(
	    		@RequestParam(value="worklog_id")String worklog_id,
	    		HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException{

    	System.out.println("Approve All Controller Called");

		 WorkLogBoImpl boImplObject = new WorkLogBoImpl();
		 boImplObject.gotoSingleParamWorklogMethod(request,response,worklog_id,"approveAllWorklogs");

	    }
	 
	 @GetMapping("/updateRejectedToApproveStatus")
	    public void updateRejetedWorklogStatus(
	    		@RequestParam(value="project_id")String p_project_id,
	    		@RequestParam(value="worklog_id")String p_worklog_id,
	    		@RequestParam(value="issue_id")String p_issue_id,
	    		HttpServletRequest request,
				HttpServletResponse response) throws JSONException, IOException{
		 System.out.println("Update Controller Called");

		 WorkLogBoImpl boImplObject = new WorkLogBoImpl();
		 boImplObject.gotoWorklogMethod(request,response,p_project_id,p_worklog_id,p_issue_id,"updateRejectedWorklog");

	    }

	    @GetMapping("/showLast7DaysData")
		public List showLast7DaysData() throws JSONException, IOException{

				WorklogsDaoImpl wd=new WorklogsDaoImpl();
				List last7DaysWeeks = wd.lastWeekLogs();

				return last7DaysWeeks;

		}

}
