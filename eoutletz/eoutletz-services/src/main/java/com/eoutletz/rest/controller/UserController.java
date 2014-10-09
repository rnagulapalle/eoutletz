package com.eoutletz.rest.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eoutletz.common.log.Logger;
import com.eoutletz.common.rest.request.CreateUserRequest;
import com.eoutletz.common.rest.request.UserLoginRequest;
import com.eoutletz.common.rest.response.BaseResponseResource;
import com.eoutletz.common.rest.response.UserResponse;
import com.eoutletz.common.rest.response.UserResponse.Data;
import com.eoutletz.persist.entity.User;
import com.eoutletz.rest.exceptions.ForbiddenException;
import com.eoutletz.rest.exceptions.InvalidArgumentException;
import com.eoutletz.rest.exceptions.NoSuchResourceFoundException;
import com.eoutletz.rest.exceptions.UserCreationFailedException;
import com.eoutletz.service.UserService;

@Controller
@RequestMapping("/api/rest/v1")
public class UserController extends BaseController {

	private Logger logger  = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user/", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<BaseResponseResource> createUser(@Valid @RequestBody final CreateUserRequest createUserRequest, BindingResult result, Errors errors) {
		
		logger.info("....create user has been called..");
		if (result.hasErrors()) {
			logger.error("Error occuered :" + errors.getFieldError().getField());
			// check this to display user error
			//TODO:http://captechconsulting.com/blog/jens-alm/versioned-validated-and-secured-rest-services-spring-40-2
			throw new InvalidArgumentException("Invalid request found");
		}
		if(createUserRequest == null) throw new InvalidArgumentException("Invalid request found");
		
		User user = userService.createUser(createUserRequest.getFirstName(), createUserRequest.getLastName(), createUserRequest.getEmail(), createUserRequest.getPassword(), createUserRequest.isMerchant());
		if(user == null) throw new UserCreationFailedException("User creation failed");
		
		BaseResponseResource response = new BaseResponseResource(HttpStatus.OK.value(), "Successfully created account");
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/user/{email}", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<UserResponse> getUser(@PathVariable String email, BindingResult result, Errors errors) {
		
		logger.info("....get user has been called..");
		if(email == null) throw new InvalidArgumentException("Invalid email");
		
		User user = userService.getUser(email);
		if(user == null) throw new NoSuchResourceFoundException("No user found with email " + email);
		BaseResponseResource baseResponse = new BaseResponseResource(HttpStatus.OK.value(), "Successfully created account");
		UserResponse response = new UserResponse();
		response.setBaseResponseResource(baseResponse);
		Data data = new Data();
		data.setFirstname(user.getFirstName());
		data.setLastname(user.getLastName());
		data.setEmail(user.getEmail());
		response.setData(data);
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/user/", method = RequestMethod.PUT, produces=MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<BaseResponseResource> updateUser(@Valid @RequestBody final CreateUserRequest createUserRequest, BindingResult result, Errors errors) {

		//TODO: update user functionality
		BaseResponseResource response = new BaseResponseResource(HttpStatus.OK.value(), "Successfully created account");
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/user/login/", method = RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<BaseResponseResource> loginUser(@Valid @RequestBody final UserLoginRequest userLoginRequest, BindingResult result, Errors errors) {
		
		logger.info("....login user has been called..");
		if (result.hasErrors()) {
			logger.error("Error occuered :" + errors.getFieldError().getField());
			// check this to display user error
			//TODO:http://captechconsulting.com/blog/jens-alm/versioned-validated-and-secured-rest-services-spring-40-2
			throw new ForbiddenException("Invalid request found");
		}
		if(userLoginRequest == null) throw new ForbiddenException("Invalid request found");
		
		User user = userService.getUser(userLoginRequest.getEmail(), userLoginRequest.getPassword());
		if(user == null) throw new ForbiddenException("No such user exist, sorry try again!");
		
		BaseResponseResource response = new BaseResponseResource(HttpStatus.OK.value(), "Successfully found user with credentials");
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
}
