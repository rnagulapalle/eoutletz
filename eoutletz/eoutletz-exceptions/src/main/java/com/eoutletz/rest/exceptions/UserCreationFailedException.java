package com.eoutletz.rest.exceptions;

public class UserCreationFailedException extends BaseRestException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UserCreationFailedException(String message) {
		super(message);
	}
}