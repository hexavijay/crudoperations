package hexa.service;


import hexa.dao.PersonDAO;
import hexa.modal.Person;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class PersonServiceImpl implements PersonService {
	
	private PersonDAO personDAO;

	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}

	@Transactional
	public void addPerson(Person p) {
		this.personDAO.addPerson(p);
	}

	@Transactional
	public void updatePerson(Person p) {
		this.personDAO.updatePerson(p);
	}

	@Transactional
	public List<Person> listPersons() {
		return this.personDAO.listPersons();
	}

	@Transactional
	public Person getPersonById(int personid) {
		return this.personDAO.getPersonById(personid);
	}

	@Transactional
	public void removePerson(int personid) {
		this.personDAO.removePerson(personid);
	}

}
