package test.hexa;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

public class Save {
	public static void main(String[] args) {
		@SuppressWarnings("deprecation")
		Session session = new AnnotationConfiguration().configure()
				.addAnnotatedClass(Person.class).buildSessionFactory()
				.openSession();
		Transaction t = session.beginTransaction();
		Person person = new Person();
		person.setId(103);
		person.setName("sathish");
		person.setSalary(20000);
		person.setJob("Developer");
		session.save(person);
		System.out.println("object saved");
		t.commit();
		session.close();
	}
}
