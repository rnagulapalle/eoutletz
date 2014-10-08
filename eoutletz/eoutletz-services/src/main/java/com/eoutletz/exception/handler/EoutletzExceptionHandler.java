package com.eoutletz.exception.handler;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.eoutletz.common.log.Logger;
import com.eoutletz.common.rest.response.ErrorResponseResource;
import com.eoutletz.rest.exceptions.BaseRestException;
import com.eoutletz.rest.exceptions.InvalidArgumentException;
import com.eoutletz.rest.exceptions.UserCreationFailedException;
@ControllerAdvice
public class EoutletzExceptionHandler extends ResponseEntityExceptionHandler{
	
	private Logger logger = Logger.getLogger(EoutletzExceptionHandler.class);
	/**
	 * this method will be called if user pass illegal argument in URL
	 * 
	 * @param ex
	 * @param request
	 * @return
	 */
	@ExceptionHandler(value = { InvalidArgumentException.class })
	public ResponseEntity<Object> processInvalidArgumentException(RuntimeException ex, WebRequest request) {
		logger.error("failed", ex);
		BaseRestException baseRestException = (BaseRestException) ex;
		
		ErrorResponseResource error = new ErrorResponseResource(HttpStatus.BAD_REQUEST.value(), baseRestException.getMessage());
        
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        
		return handleExceptionInternal(ex, error, headers, HttpStatus.BAD_REQUEST, request);
	}
	
	@ExceptionHandler(value = { UserCreationFailedException.class })
	public ResponseEntity<Object> processUserCreationFailedException(RuntimeException ex, WebRequest request) {
		logger.error("failed", ex);
		BaseRestException baseRestException = (BaseRestException) ex;
		
		ErrorResponseResource error = new ErrorResponseResource(HttpStatus.BAD_REQUEST.value(), baseRestException.getMessage());
        
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        
		return handleExceptionInternal(ex, error, headers, HttpStatus.BAD_REQUEST, request);
	}
	
//	@ExceptionHandler(value = { MethodArgumentNotValidException.class })
//	public ResponseEntity<Object> processMethodArgumentNotValidException(Exception ex, WebRequest request) {
//		logger.error("failed", ex);
//		MethodArgumentNotValidException methodArgumentNotValidException = (MethodArgumentNotValidException) ex;
//		
//		ErrorResponseResource error = new ErrorResponseResource(HttpStatus.BAD_REQUEST.value(), methodArgumentNotValidException.getMessage());
//        
//		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        
//		return handleExceptionInternal(ex, error, headers, HttpStatus.BAD_REQUEST, request);
//	}
}
