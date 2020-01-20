package com.script.script.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.script.script.model.Product;
import com.script.script.repository.ProductRepository;

@Controller
public class TestController {

	@Autowired
	private ProductRepository pr;
	
	@GetMapping("/")
	public  String testProduct(Model model) {
		List<Product> products = pr.findAll();
	    model.addAttribute("products",products);
		return "/index";
	}
	
	
}