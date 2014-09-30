package com.eoutletz.rest.controller;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/rest")
@ComponentScan
public abstract class EoutletzRestBaseController {

	//TODO: add common functionality for all controllers
}
