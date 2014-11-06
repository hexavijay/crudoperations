package test.hexa;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

public class Save_Update {
	public static void main(String[] args) {
		Session session = (Session) new AnnotationConfiguration().configure()
				.addAnnotatedClass(Person.class).buildSessionFactory()
				.openSession();
		Transaction t=session.beginTransaction();
		Person person=(Person) session.get(Person.class, 103);
		person.setName("sathish kumar");
		session.saveOrUpdate(person);
		t.commit();
		session.close();
		

	}
}
