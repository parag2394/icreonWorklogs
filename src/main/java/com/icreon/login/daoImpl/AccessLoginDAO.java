package com.icreon.login.daoImpl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.icreon.login.dao.LoginDAO;
import com.icreon.login.model.Login;
import com.icreon.util.HibernateUtil;



public class AccessLoginDAO implements LoginDAO {

	public List authenticate_user(String username,String password)
	{
		Login l=new Login();

		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		SQLQuery query = (SQLQuery) session.createSQLQuery("call icreonworklogs.authenticate_user(:p_username,:p_password)")
				.setParameter("p_username", username)
				.setParameter("p_password", password);
		query.executeUpdate();
		List<Object[]> list=query.list();
		System.out.println(list.get(0));
		session.close();
		 return list;
		
	}
	
}
