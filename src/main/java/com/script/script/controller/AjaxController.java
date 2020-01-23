package com.script.script.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.script.script.model.Product;
import com.script.script.repository.ProductRepository;

@Controller
public class AjaxController {
	
	@Autowired
	private ProductRepository pr;
	
	// 리스트 전체
		@GetMapping("/")
		public  String testProduct(Model model) {
			List<Product> products = pr.findAll();
		    model.addAttribute("products",products);
			return "/index";
		}

//	카테고리 별 리스트
	@GetMapping("/{category}")
	public String kitchin(Model model,@PathVariable String category){
		
		List<Product> products = pr.findByCategory(category);
		model.addAttribute("products",products);
		return "index";
	}
	
	@GetMapping("/pdesc")
	public  String priceDesc(Model model) {
		List<Product> products = pr.findAllByOrderByPriceDesc();
	    model.addAttribute("products",products);
		return "/index";
	}
	
	@GetMapping("/odesc")
	public  String orderDesc(Model model) {
		List<Product> products = pr.findAllByOrderByOrderDesc();
	    model.addAttribute("products",products);
		return "/index";
	}
	
	@GetMapping("/makedesc")
	public  String makeDesc(Model model) {
		List<Product> products = pr.findAllByOrderByMakeDesc();
	    model.addAttribute("products",products);
		return "/index";
	}
	
}
