package com.eoutletz.common.rest.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class BaseResponseResource {

	private int code;
    private String message; 
    public BaseResponseResource(){}
    
    public BaseResponseResource(int code, String message){
    	this.code = code;
    	this.message = message;
    }
    public int getCode() { return code; }

    public void setCode(int code) { this.code = code; }

    public String getMessage() { return message; }

    public void setMessage(String message) { this.message = message; }
}
