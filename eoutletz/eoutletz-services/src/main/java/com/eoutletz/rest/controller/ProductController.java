package com.eoutletz.rest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eoutletz.common.log.Logger;
import com.eoutletz.common.rest.response.BaseResponseResource;
import com.eoutletz.common.rest.response.ProductResponse;
import com.eoutletz.common.rest.response.ProductResponse.Data;
import com.eoutletz.persist.entity.Product;
import com.eoutletz.rest.exceptions.NoSuchResourceFoundException;
import com.eoutletz.service.ProductService;

@Controller
@RequestMapping("/api/rest/v1")
public class ProductController extends BaseController{

	private Logger logger  = Logger.getLogger(UserController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/product/all/", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ProductResponse> getUser(HttpServletRequest request) {
		
		logger.info("....get product has been called..");
		
		List<Product> products = productService.getLatestProducts();
		if(products == null) throw new NoSuchResourceFoundException("No resources found");
		BaseResponseResource baseResponse = new BaseResponseResource(HttpStatus.OK.value(), "Successfully created account");
		ProductResponse response = new ProductResponse();
		
		Data data = new Data();
		data.setResponse(baseResponse);
		data.setName("test");
		
		response.setData(data);
		
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
}
