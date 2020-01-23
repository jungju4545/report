package com.script.script.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.script.script.model.Product;
import com.script.script.repository.ProductRepository;

@Controller
public class TestController {

	@Autowired
	private ProductRepository pr;
	
//	// 리스트 전체
//	@GetMapping("/")
//	public  String testProduct(Model model) {
//		List<Product> products = pr.findAll();
//	    model.addAttribute("products",products);
//		return "/index";
//	}
	

	
}
