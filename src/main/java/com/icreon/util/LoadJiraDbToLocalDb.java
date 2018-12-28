package com.icreon.util;

import java.text.ParseException;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class LoadJiraDbToLocalDb {
	
	String url="https://api.tempo.io/2/";
	   
    String worklogs="worklogs";
    
    String issue="issue";
	
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

	 public int getDepartments() throws ParseException
		{
		 
        final String uri =url+worklogs+"/"+issue+"/"+"NBPICREON-9";
		 
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
	        String project="Non Billable Project";
	        for(int i=0; i < jsonResults.length();i++){
	        	int worklogId =jsonResults.getJSONObject(i).getInt("tempoWorklogId");
	        	String worklog=Integer.toString(worklogId);
	        	String issueNo = jsonResults.getJSONObject(i).getJSONObject("issue").getString("key");
	        	String startDate=jsonResults.getJSONObject(i).getString("startDate");
	        //	Date date1=(Date) new SimpleDateFormat("yyyy/MM/dd").parse(startDate);  
	        	String description=jsonResults.getJSONObject(i).getString("description");
	        	String author=jsonResults.getJSONObject(i).getJSONObject("author").getString("displayName");
	        	int timeSpentSeconds =jsonResults.getJSONObject(i).getInt("timeSpentSeconds")/3600;
	        	String updatedDate = (jsonResults.getJSONObject(i).getString("updatedAt")).substring(0,10);
	            
	      
	        	
	        	SessionFactory sf = HibernateUtil.getSessionFactory();
				Session session=sf.openSession();
				Transaction tx=session.beginTransaction();
				SQLQuery query = (SQLQuery) session.createSQLQuery("call icreonworklogs.pro_setWorklogs(:p_project_id,:p_issue_id,:p_worklog_id,"
						+ ":p_start_date,:p_description,:p_author,:p_time_spent,:p_status, :p_updated_date)")
						.setParameter("p_project_id",project)
						.setParameter("p_issue_id",issueNo)
						.setParameter("p_worklog_id",worklog)
						.setParameter("p_start_date",startDate)
						.setParameter("p_description",description)
						.setParameter("p_author",author)
						.setParameter("p_time_spent",timeSpentSeconds)
						.setParameter("p_status",2)
						.setParameter("p_updated_date",updatedDate);
						;
				query.executeUpdate();
				//List<Object[]> l=query.list();
				
		  tx.commit();
			session.close();
	         
	        }
				
				
			return 0;
		}
	
	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
LoadJiraDbToLocalDb t=new LoadJiraDbToLocalDb();
t.getDepartments();
	}

}
