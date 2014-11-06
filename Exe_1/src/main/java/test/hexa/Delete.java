package test.hexa;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

public class Delete {
	public static void main(String[] args) {
		Session session = new AnnotationConfiguration().configure()
				.addAnnotatedClass(Person.class).buildSessionFactory()
				.openSession();
		Transaction t = session.beginTransaction();
		Person person=(Person) session.load(Person.class, 22);
		session.delete(person);
		System.out.println("Person deleted Successfully");
		t.commit();
		session.close();
		
	}
}
