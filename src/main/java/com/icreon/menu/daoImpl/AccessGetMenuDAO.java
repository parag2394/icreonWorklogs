package com.icreon.menu.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.icreon.menu.dao.GetMenuDAO;
import com.icreon.util.HibernateUtil;



public class AccessGetMenuDAO implements GetMenuDAO {
	List<Object[]> l;
	public List getMenuItem(int user_id) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		try
		{

			
			Transaction tx=session.beginTransaction();
			SQLQuery query = (SQLQuery) session.createSQLQuery("SELECT * FROM icreonworklogs.pro_getmenuitem(:user_id)")
					.setParameter("user_id",user_id);
			 l=query.list();
			 tx.commit();
			 session.close();
		}
		catch (Exception e) 
		{
			session.close();
			e.printStackTrace();
		}
		
		
		return l;
		
		
	}

}
