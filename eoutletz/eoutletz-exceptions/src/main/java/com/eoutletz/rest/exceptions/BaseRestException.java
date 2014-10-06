package com.eoutletz.rest.exceptions;

import org.springframework.validation.Errors;

@SuppressWarnings("serial")
public class BaseRestException extends RuntimeException {

	private Errors errors;

	public BaseRestException(String message) {
		super(message);
		// this.errors = errors;
	}

	public Errors getErrors() {
		return errors;
	}
}
