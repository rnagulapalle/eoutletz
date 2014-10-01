package com.eoutletz.exception.handler;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.eoutletz.common.rest.response.ErrorResponseResource;
@ControllerAdvice
public class EoutletzExceptionHandler extends ResponseEntityExceptionHandler{

	/**
	 * this method will be called if user pass illegal argument in URL
	 * 
	 * @param ex
	 * @param request
	 * @return
	 */
	@ExceptionHandler(value = { IllegalArgumentException.class })
	public ResponseEntity<Object> handleInvalidArgumentException(RuntimeException ex, WebRequest request) {
//		logger.error("failed", ex);
//		
//		logger.info("handling Invalid Argument Exception - Catching: " + ex.getClass().getSimpleName());
		IllegalArgumentException invalidBenefitFocusArgument = (IllegalArgumentException) ex;
		
		ErrorResponseResource error = new ErrorResponseResource(HttpStatus.BAD_REQUEST.value(), invalidBenefitFocusArgument.getMessage());
        
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        
		return handleExceptionInternal(ex, error, headers, HttpStatus.BAD_REQUEST, request);
	}
}
