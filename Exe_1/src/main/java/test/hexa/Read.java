package test.hexa;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

public class Read {
	public static void main(String[] args) {
		Session session = new AnnotationConfiguration().configure()
				.addAnnotatedClass(Person.class).buildSessionFactory()
				.openSession();
		Transaction t = session.beginTransaction();
		// Query query = session.createQuery("from PERSON");
		// List<Person> persons = query.list();
		// for (Person person : persons) {
		// System.out.println("Person Id : " + person.getId()
		// + "\nPerson Name : " + person.getName() + "\nPerson Job : "
		// + person.getJob() + "\nPerson Salary : "
		// + person.getSalary());
		// }
		List list = (List) session.createQuery("from Person").list();
		Iterator itr = list.iterator();
		while (itr.hasNext()) {
			Person person = (Person) itr.next();
			System.out.println("Person id :" + person.getId()
					+ "\nperson name :" + person.getName() + "\nperson job :"
					+ person.getJob() + "\nperson salary :"
					+ person.getSalary());
		}
		t.commit();
		session.close();
	}
}
