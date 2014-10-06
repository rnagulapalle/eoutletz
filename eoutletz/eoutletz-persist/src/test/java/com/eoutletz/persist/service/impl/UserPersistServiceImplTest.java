package com.eoutletz.persist.service.impl;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.notNullValue;
import static org.hamcrest.Matchers.nullValue;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eoutletz.persist.entity.User;
import com.eoutletz.persist.repository.UserRepository;
import com.eoutletz.persist.service.UserPersistService;

public class UserPersistServiceImplTest extends SuperPersistServiceImplTest {

	private static final String DUMMY_DATA = "dummy";
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserPersistService userPersistService;

	@Test
	public void testSave() {
		User user = createUser();
		assertThat(user, notNullValue());
	}

	@Test
	public void testSaveUser() {
		User user = userSave();
		assertThat(user, notNullValue());
	}
	
	@Test
	public void testSaveMerchant() {
		User user = createMerchant();
		assertThat(user, notNullValue());
	}
	
	@Test
	public void testSaveMerchantByService() {
		User user = createMerchantByService();
		assertThat(user, notNullValue());
	}

	@Test
	public void testFindById() {
		User user = createUser();

		User result = userRepository.findById(user.getId());

		assertThat(result, notNullValue());
		assertThat(result.getFirstName(), equalTo(DUMMY_DATA));
	}

	@Test
	public void testFindById2() {
		User user = userSave();

		User result = userRepository.findById(user.getId());

		assertThat(result, notNullValue());
		assertThat(result.getFirstName(), equalTo(DUMMY_DATA));
	}

	@Test
	public void testDelete() {
		User user = createUser();

		userRepository.delete(user);

		User result = userRepository.findById(user.getId());

		assertThat(user, notNullValue());
		assertThat(result, nullValue());
	}

	@Test
	public void testFindByEmail() {
		User user = createUser();

		User result = userRepository.findByEmail(user.getEmail());

		assertThat(result, notNullValue());

		assertThat(result.getEmail(), equalTo(DUMMY_DATA));
	}

	private User userSave() {
		User user = new User();

		user.setFirstName(DUMMY_DATA);
		user.setLastName(DUMMY_DATA);
		user.setEmail(DUMMY_DATA);

		return userPersistService.saveUser(user);
	}

	private User createUser() {
		User user = new User();

		user.setFirstName(DUMMY_DATA);
		user.setLastName(DUMMY_DATA);
		user.setEmail(DUMMY_DATA);

		return userRepository.save(user);
	}
	
	private User createMerchant() {
		User user = new User();

		user.setFirstName(DUMMY_DATA);
		user.setPassword(DUMMY_DATA);
		user.setMerchant(Boolean.TRUE);
		user.setLastName(DUMMY_DATA);
		user.setEmail(DUMMY_DATA);

		return userRepository.save(user);
	}
	private User createMerchantByService() {
		User user = new User();

		user.setFirstName(DUMMY_DATA);
		user.setPassword(DUMMY_DATA);
		user.setMerchant(Boolean.TRUE);
		user.setLastName(DUMMY_DATA);
		user.setEmail(DUMMY_DATA);

		return userRepository.save(user);
	}
}
