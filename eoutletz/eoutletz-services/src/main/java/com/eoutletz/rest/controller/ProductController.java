package com.eoutletz.rest.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eoutletz.common.constants.Constants.ProductType;
import com.eoutletz.common.log.Logger;
import com.eoutletz.persist.entity.Image;
import com.eoutletz.persist.entity.Product;
import com.eoutletz.rest.exceptions.NoSuchResourceFoundException;
import com.eoutletz.service.ProductService;
import com.eoutletz.service.rest.response.BaseResponseResource;
import com.eoutletz.service.rest.response.ProductResponse;
import com.eoutletz.service.rest.response.ProductResponse.Data;
import com.eoutletz.service.rest.response.ProductResponse.ProductJson;

@Controller
@RequestMapping("/api/rest/v1")
public class ProductController extends BaseController{

	private Logger logger  = Logger.getLogger(UserController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/products/{type}/{limit}/", method = RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ProductResponse> getUser(@PathVariable("type")  int type, @PathVariable("limit")  int limit) {
		
		logger.info("....get product has been called..");
		//check type and limit values
		
		ProductType productType = ProductType.values()[type];
		List<Product> products = null;
		
		switch(productType){
		
		case NEW:
			products = productService.getLatestProducts(limit);
			break;
		
		default:
			throw new NoSuchResourceFoundException("no such resource found with type " + type);
		}
		
		if(products == null) throw new NoSuchResourceFoundException("No products found");
		
		BaseResponseResource baseResponse = new BaseResponseResource(HttpStatus.OK.value(), "Successfully fetched products");
		ProductResponse response = new ProductResponse();
		
		Data data = new Data();
		data.setResponse(baseResponse);
		
		List<ProductJson> productJsons = new ArrayList<>();
		
		//TODO: this loop needs to be optimize as it takes O(NxM) time
		for(Product product :  products){
			
			ProductJson productJson = new ProductJson();
			productJson.setId(product.getId());
			productJson.setName(product.getName());
			productJson.setDescritpion(product.getDecription());
			Set<Image> images = product.getImages();
			Set<String> imgSet = new TreeSet<String>();
			
			for(Image image : images){
				imgSet.add(image.getImage());
			}
			
			productJson.setImages(imgSet);
			
			productJsons.add(productJson);
			
		}
		
		data.setProductJsons(productJsons);
		response.setData(data);
		
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		return new ResponseEntity<>(response, headers, HttpStatus.OK);
	}
}
