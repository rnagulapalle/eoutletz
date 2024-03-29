package com.eoutletz.rest.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eoutletz.common.log.Logger;
import com.eoutletz.common.rest.response.BaseResponseResource;
import com.eoutletz.rest.exceptions.InvalidArgumentException;
import com.eoutletz.service.EchoService;

@Controller
@RequestMapping("/api/rest/v1")
public class EchoController extends BaseController {

	private final static Logger logger = Logger.getLogger(EchoController.class);
	@Autowired
	private EchoService echoService;
	
	@RequestMapping(value = "/echo/", method = RequestMethod.GET, produces="application/json")
	public ResponseEntity<BaseResponseResource> getEcho(HttpServletRequest request) {
		logger.info("....echo has been called..");
		BaseResponseResource response = new BaseResponseResource(HttpStatus.OK.value(), echoService.echo());
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/error/", method = RequestMethod.GET, produces="application/json")
	public ResponseEntity<BaseResponseResource> getError(HttpServletRequest request) {
		throw new InvalidArgumentException("Invalid argument found, good luck!");
	}
}
