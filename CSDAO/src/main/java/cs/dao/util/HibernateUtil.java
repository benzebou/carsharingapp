package cs.dao.util;

import java.io.File;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	private static final SessionFactory sessionFactory;

	static
	{
		try
		{
			// Crée la SessionFactory
			sessionFactory = new Configuration().configure().setProperty("hibernate.show_sql","true").buildSessionFactory();
		}
		catch (HibernateException ex)
		{
			System.out.println("Exception dans HibernateUtil");
			throw new RuntimeException("Problème de configuration : "  + ex.getMessage(), ex);
		}
	}

	public static final ThreadLocal session = new ThreadLocal();

	public static Session currentSession() throws HibernateException
	{
		Session s = (Session) session.get();
		// Ouvre une nouvelle Session, si ce Thread n'en a aucune
		//s = sessionFactory.openSession();
		/*
		if (s == null) {
			s = sessionFactory.openSession();
			session.set(s);
		}
		return s;
		*/
		return sessionFactory.openSession();
	}

	public static void closeSession() throws HibernateException {
		Session s = (Session) session.get();
		//session.set(null);
		//if (s != null) s.close();
	}
}