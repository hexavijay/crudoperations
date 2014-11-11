package hexa.service;

import hexa.modal.Person;

import java.util.List;

public interface PersonService {

	public void addPerson(Person p);

	public void updatePerson(Person p);

	public List<Person> listPersons();

	public Person getPersonById(int personid);

	public void removePerson(int personid);

}
