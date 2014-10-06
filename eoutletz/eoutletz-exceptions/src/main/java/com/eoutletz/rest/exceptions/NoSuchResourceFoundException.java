package com.eoutletz.rest.exceptions;


@SuppressWarnings("serial")
public class NoSuchResourceFoundException extends BaseRestException {
	public NoSuchResourceFoundException(String message) {
		super(message);
		// this.errors = errors;
	}

}
