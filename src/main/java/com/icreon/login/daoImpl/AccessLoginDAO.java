package com.icreon.login.daoImpl;

import java.util.List;

import com.icreon.util.CallApiService;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.icreon.login.dao.LoginDAO;
import com.icreon.login.model.Login;
import com.icreon.util.HibernateUtil;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;

import static com.icreon.util.ApplicationConstants.ICREONJIRA_URL;


public class AccessLoginDAO implements LoginDAO {

	public List authenticate_user(String username,String password)
	{
		Login l=new Login();

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call authenticate_user(:p_username,:p_password)")
				.setParameter("p_username", username)
				.setParameter("p_password", password);
		query.executeUpdate();
		List<Object[]> list=query.list();
		System.out.println(list.get(0));
		session.close();
		 return list;
		
	}


	public int validateUser_withJIRA(String username, String password)
	{

		String uri = ICREONJIRA_URL + "user?username=" + username.substring(0,username.indexOf("@"));

		System.out.println(username);
		System.out.println(uri);
		CallApiService callApiService = new CallApiService();
		int responseCode = 0;
		try{
			responseCode = callApiService.validateJiraUser(uri,username,password);

			if(responseCode == 200){
				System.out.println("Success");
			}
			else{
				System.out.println("Failed");
			}



		}
		catch (HttpServerErrorException httpClientOrServerExc)
		{
			if(HttpStatus.NOT_FOUND.equals(httpClientOrServerExc.getStatusCode()))
			{
				System.out.println("Unauthorised");
			}
			else if(HttpStatus.UNAUTHORIZED.equals(httpClientOrServerExc.getStatusCode()))
			{
				System.out.println("Unauthorised");
			}
		}
		catch(HttpClientErrorException httpClientOrServerExc1)
		{
			if(HttpStatus.UNAUTHORIZED.equals(httpClientOrServerExc1.getStatusCode()))
			{
				System.out.println("Client Unauthorised");
			}

		}

		return responseCode;


	}

	
}
