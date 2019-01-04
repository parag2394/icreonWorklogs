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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import static com.icreon.util.ApplicationConstants.*;


@RestController
@RequestMapping("/admin")
public class LoadJiraDbToLocalDb {


	public JSONArray showSelectedWorklogs1(String issue1) throws Throwable
	{

		final String uri =TEMPO_URL +CONSTANT_WORKLOGS+"/"+CONSTANT_ISSUE+"/"+issue1;

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


	@GetMapping("/db/updatedatabase")
	public String getDepartments() throws ParseException
	{

		System.out.println("Starting operations.....");
		int p_Start=1;
		int p_End=11;
		String project=null;

		// final String uri =url+worklogs+"/"+issue+"/"+"POL-1";
		String uri = TEMPO_URL+CONSTANT_WORKLOGS+"/"+CONSTANT_ISSUE+"/";
		String polUrl=TEMPO_URL+CONSTANT_WORKLOGS+"/"+CONSTANT_ISSUE+"/"+CONSTANT_POL+"-";
		String nbpUrl=TEMPO_URL+CONSTANT_WORKLOGS+"/"+CONSTANT_ISSUE+"/"+CONSTANT_NBPICREON+"-";
		String check1=TEMPO_URL+CONSTANT_WORKLOGS+"/"+CONSTANT_ISSUE+"/"+CONSTANT_POL+"-";;
		String check2=TEMPO_URL+CONSTANT_WORKLOGS+"/"+CONSTANT_ISSUE+"/"+CONSTANT_NBPICREON+"-";


		for(int j=p_Start;j<=p_End;j++) {

			if(check1.equals(polUrl)){
				uri=polUrl+j;
				project=CONSTANT_POLITICO;

				System.out.println("..."+uri);
				System.out.println("Starting operation for: " +project);
				doTransaction(uri,project);
				System.out.println("Completed operation for:" +project);

			}
		}
		int n_Start=1;
		int n_End=9;
		for(int j=n_Start;j<=n_End;j++) {
			if(check2.equals(nbpUrl)){

				uri=nbpUrl+j;
				project= CONSTANT_NBPICREON;

				System.out.println("..."+uri);
				System.out.println("Starting operation for: " +project);
				doTransaction(uri,project);
				System.out.println("Completed operation for: " +project);

			}
		}

		return "Completed Transaction";

	}


	private void doTransaction(String uri,String project) throws ParseException {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		//  headers.set("Authorization", "Bearer GPWhDgspyrqceOYWRbhij3ER6nNqoV");
		headers.set("Authorization", "Bearer XHArc0TYGjXuNV1ElvLuA4XTnZ6T4F");

		HttpEntity entity = new HttpEntity(headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);

		//  ResponseEntity<String> response = restTemplate.exchange(uri2, HttpMethod.GET, entity, String.class);

		JSONObject myResponse = new JSONObject(response.getBody());

		JSONArray jsonResults = myResponse.getJSONArray("results");
		System.out.println(jsonResults);
		for(int i=0; i < jsonResults.length();i++) {
			int worklogId = jsonResults.getJSONObject(i).getInt("tempoWorklogId");
			String worklog = Integer.toString(worklogId);
			String issueNo = jsonResults.getJSONObject(i).getJSONObject("issue").getString("key");
			String startDate = jsonResults.getJSONObject(i).getString("startDate");
			//	Date date1=(Date) new SimpleDateFormat("yyyy/MM/dd").parse(startDate);
			String description = jsonResults.getJSONObject(i).getString("description");
			String author = jsonResults.getJSONObject(i).getJSONObject("author").getString("displayName");
			int timeSpentSeconds = jsonResults.getJSONObject(i).getInt("timeSpentSeconds") / 3600;
			String updatedDate = (jsonResults.getJSONObject(i).getString("updatedAt")).substring(0, 10);

			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			Transaction tx = session.beginTransaction();
			SQLQuery query = (SQLQuery) session.createSQLQuery("call pro_setWorklogs(:p_project_id,:p_issue_id,:p_worklog_id,"
					+ ":p_start_date,:p_description,:p_author,:p_time_spent,:p_status, :p_updated_date)")
					.setParameter("p_project_id", project)
					.setParameter("p_issue_id", issueNo)
					.setParameter("p_worklog_id", worklog)
					.setParameter("p_start_date", startDate)
					.setParameter("p_description", description)
					.setParameter("p_author", author)
					.setParameter("p_time_spent", timeSpentSeconds)
					.setParameter("p_status", 2)
					.setParameter("p_updated_date", updatedDate);
			;
			query.executeUpdate();
			//List<Object[]> l=query.list();

			tx.commit();
			session.close();


		}
	}

	@GetMapping("/hi")
	public String adminLogin(){
		return "Hi Admin! Careful!! This operation cannot be reversed!!";

	}

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		LoadJiraDbToLocalDb t=new LoadJiraDbToLocalDb();
		t.getDepartments();
	}

}
