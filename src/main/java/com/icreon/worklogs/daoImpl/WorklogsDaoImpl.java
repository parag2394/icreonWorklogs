package com.icreon.worklogs.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.icreon.login.model.Login;
import com.icreon.util.HibernateUtil;

public class WorklogsDaoImpl {
	
	public List showSelectedWorklogs(String issue)
	{
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_getWorklogs_wrt_issue_ID(:p_issue_id)")
				.setParameter("p_issue_id",issue);
				
	//	query.executeUpdate();
		List<Object[]> list=query.list();
		
		session.close();
		 return list;
		
	}
	
	public List showSelectedWorklogsWrtUser(String issue,String username)
	{
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_getWorklogs_wrt_issue_user(:p_issue_id,:p_author)")
				.setParameter("p_issue_id",issue)
				.setParameter("p_author",username)
				;
				
//		query.executeUpdate();
		List<Object[]> list=query.list();
		
		session.close();
		 return list;
		
	}
	
	public List showSelectedWorklogsWrtOnlyUser(String username)
	{
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_getWorklogs_wrt_user(:p_author)")
				
				.setParameter("p_author",username)
				;
				
		//query.executeUpdate();
		List<Object[]> list=query.list();
		
		session.close();
		 return list;
		
	}
	
	public List showSelectedWorklogsWrtOnlyDate(String fromDate,String toDate)
	{
		
System.out.println("Start date is"+fromDate);
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_getWorklogs_wrt_date(:p_from_date,:p_to_date)")
				
				.setParameter("p_from_date",fromDate.trim())
				.setParameter("p_to_date",toDate.trim())
				;
				
	//	query.executeUpdate();
		List<Object[]> list=query.list();
		
		session.close();
		 return list;
		
	}
	
	public List showSelectedWorklogsWrtAll(String issue,String username,String fromDate,String toDate)
	{
		
System.out.println("Start date is"+fromDate);
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_getWorklogs_wrt_all(:p_issue_id,:p_author,:p_from_date,:p_to_date)")
				.setParameter("p_issue_id",issue)
				.setParameter("p_author",username)
				.setParameter("p_from_date",fromDate)
				.setParameter("p_to_date",toDate)
				;
				
	//	query.executeUpdate();
		List<Object[]> list=query.list();
		
		session.close();
		 return list;
		
	}
	
	public void updateSelectedWorklog(String p_project_id,String p_worklog_id,String p_issue_id)
	{
		
		System.out.println("Update DAO");

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_setWorklogs_aprove_status(:p_project_id,:p_worklog_id,"
				+ ":p_issue_id)")
				.setParameter("p_project_id",p_project_id.trim())
				.setParameter("p_worklog_id",p_worklog_id.trim())
				.setParameter("p_issue_id",p_issue_id.trim())
				;
				
		query.executeUpdate();
		System.out.println("Query Executed");
		//List<Object[]> list=query.list();
		tx.commit();
		session.close();
		 
		
	}
	
	public List approvedWorklog()
	{
		
		
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_getApprovedWorklogs()");
				
	//	query.executeUpdate();
		System.out.println("Query Executed");
		List<Object[]> list=query.list();
		tx.commit();
		session.close();
		 
		return list;
	}
	
	public List unApprovedWorklog()
	{
		
		
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_getUnApprovedWorklogs()");
				
		//query.executeUpdate();
		System.out.println("Query Executed");
		List<Object[]> list=query.list();
		tx.commit();
		session.close();
		 
		return list;
	}
	
	
	public List showSelectedAuthors(String issue)
	{
		

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_getAuthors(:p_issue_id)")
				.setParameter("p_issue_id",issue);
				
	//	query.executeUpdate();
		List<Object[]> list=query.list();
		
		session.close();
		 return list;
		
	}
	
	public int approveAllWorklogs(String p_worklog_id)
	{
		
		System.out.println("Update DAO");

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call ijp.pro_approveAll(:p_worklog_id)")
				.setParameter("p_worklog_id",p_worklog_id.trim());
				
		query.executeUpdate();
		System.out.println("Query Executed");
		//List<Object[]> list=query.list();
		tx.commit();
		session.close();
		 return 1;
		
	}

}
