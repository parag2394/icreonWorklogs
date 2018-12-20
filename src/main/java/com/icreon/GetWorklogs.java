package com.icreon;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class GetWorklogs {
	
	
	    String username;
	   
	    String password;
	  
	    String url="https://api.tempo.io/2/";
	   
	    String worklogs="worklogs";
	   
	    String project;
	  
	    String issue="issue";
	
	   
	    String issueNo="/POL-5";
	    
	  
	
	public JSONArray showWorklogs() throws Throwable
	{
		 final String uri =url+worklogs+"/"+issue+issueNo;
		 
		 System.out.println(uri);
		 
		 HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	      //  headers.set("Authorization", "Bearer GPWhDgspyrqceOYWRbhij3ER6nNqoV");
	        headers.set("Authorization", "Bearer XHArc0TYGjXuNV1ElvLuA4XTnZ6T4F");
	       // headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
	        
	        HttpEntity entity = new HttpEntity(headers);

	        RestTemplate restTemplate = new RestTemplate();
	        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);

	     /*   restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
	        String output=restTemplate.getForObject(projectUri,String.class);*/

	        JSONObject myResponse = new JSONObject(response.getBody());

	        JSONArray jsonResults = myResponse.getJSONArray("results");
	        System.out.println(jsonResults);

	        for(int i=0; i < jsonResults.length();i++){
	            System.out.println(jsonResults.getJSONObject(i).getInt("tempoWorklogId"));
	            System.out.println(jsonResults.getJSONObject(i).getJSONObject("issue").getString("key"));
	            System.out.println(jsonResults.getJSONObject(i).getString("startDate"));
	            System.out.println(jsonResults.getJSONObject(i).getString("description"));
	            System.out.println(jsonResults.getJSONObject(i).getJSONObject("author").getString("displayName"));
	            System.out.println(jsonResults.getJSONObject(i).getInt("timeSpentSeconds"));
	        }


	        int worklogsCount = myResponse.getJSONObject("metadata").getInt("count");
	        int worklogId = jsonResults.getJSONObject(0).getInt("tempoWorklogId");
	        String issueNo = jsonResults.getJSONObject(0).getJSONObject("issue").getString("key");
	        String startDate = jsonResults.getJSONObject(0).getString("startDate");
	        String description = jsonResults.getJSONObject(0).getString("description");
	        String author = jsonResults.getJSONObject(0).getJSONObject("author").getString("displayName");
	        int timeSpentSeconds = jsonResults.getJSONObject(0).getInt("timeSpentSeconds");
	        
	        
	        
	       
		    return jsonResults;
	}
	
	
	public List showSelectedWorklogs(String issue1) throws Throwable
	{
		 final String uri =url+worklogs+"/"+issue+"/"+issue1;
		 
		 System.out.println(uri);
		 
		 HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	      //  headers.set("Authorization", "Bearer GPWhDgspyrqceOYWRbhij3ER6nNqoV");
	        headers.set("Authorization", "Bearer XHArc0TYGjXuNV1ElvLuA4XTnZ6T4F");
	       // headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
	        
	        HttpEntity entity = new HttpEntity(headers);

	        RestTemplate restTemplate = new RestTemplate();
	        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);

	     /*   restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(username,password));
	        String output=restTemplate.getForObject(projectUri,String.class);*/

	        JSONObject myResponse = new JSONObject(response.getBody());

	        JSONArray jsonResults = myResponse.getJSONArray("results");
	        System.out.println(jsonResults);
	        ArrayList l = new ArrayList();
	        for(int i=0; i < jsonResults.length();i++){
	        	
	        	l.add(jsonResults.getJSONObject(i).getInt("tempoWorklogId"));
	        	l.add(jsonResults.getJSONObject(i).getJSONObject("issue").getString("key"));
	        	l.add(jsonResults.getJSONObject(i).getString("startDate"));
	        	l.add(jsonResults.getJSONObject(i).getString("description"));
	        	l.add(jsonResults.getJSONObject(i).getJSONObject("author").getString("displayName"));
	        	l.add(jsonResults.getJSONObject(i).getInt("timeSpentSeconds")/3600);
	        	
	        }
	        
	        
	    

	      System.out.println(l);
	        
	        
	       
		    return l;
	}
	
	
	
	public JSONArray showSelectedWorklogs1(String issue1) throws Throwable
	{
		 final String uri =url+worklogs+"/"+issue+"/"+issue1;
		 
		 System.out.println(uri);
		 
		 HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	      //  headers.set("Authorization", "Bearer GPWhDgspyrqceOYWRbhij3ER6nNqoV");
	        headers.set("Authorization", "Bearer XHArc0TYGjXuNV1ElvLuA4XTnZ6T4F");
	       
	        HttpEntity entity = new HttpEntity(headers);

	        RestTemplate restTemplate = new RestTemplate();
	        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);

	        JSONObject myResponse = new JSONObject(response.getBody());

	        JSONArray jsonResults = myResponse.getJSONArray("results");
	        System.out.println(jsonResults);
		    return jsonResults;
	}

}
