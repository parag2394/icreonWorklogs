package com.icreon.bin;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

public class GetProjects {
	    
	    String username="rohit@icreon.com";
	   
	    String password="Rrp@1993";
	  
	    String url="https://icreontech.atlassian.net/rest/api/2/";
	   
	    String worklogs="worklogs";
	   
	    String project="project";
	  
	    String issue="issue";
	
	   
	  
	public JSONArray getProjectsInfo() throws JSONException
	{
		final String projectUri = url+project;
		RestTemplate restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
        String output=restTemplate.getForObject(projectUri,String.class);

        JSONArray projectResponse = new JSONArray(output);
	    return projectResponse;
	}

}
