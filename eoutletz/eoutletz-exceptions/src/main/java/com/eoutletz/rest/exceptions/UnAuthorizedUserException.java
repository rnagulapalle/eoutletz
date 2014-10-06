package com.eoutletz.rest.exceptions;


@SuppressWarnings("serial")
public class UnAuthorizedUserException extends BaseRestException {

	public UnAuthorizedUserException(String message){
		super(message);
		
	}
}
