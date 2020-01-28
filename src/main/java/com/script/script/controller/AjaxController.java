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
	public String wholeProduct(Model model) {
		List<Product> products = pr.findAll();
	    model.addAttribute("products",products);
		return "index";
	}
	
		@GetMapping("/whole")
		public@ResponseBody List testProduct(Model model) {
			List<Product> products = pr.findAll();
		    model.addAttribute("products",products);
			return products;
		}
		
		@GetMapping("/product")
		public @ResponseBody List<Product> jsonProduct(Model model) {
			List<Product> products = pr.findAll();
		    model.addAttribute("products",products);
			return products;
		}
		

//	카테고리 별 리스트
	@GetMapping("/{category}")
	public @ResponseBody List<Product> kitchin(Model model,@PathVariable String category){
		List<Product> products = pr.findByCategory(category);
		model.addAttribute("products",products);
		return products;
	}
	
	@GetMapping("/pdesc")
	public  @ResponseBody List<Product> priceDesc(Model model) {
		List<Product> products = pr.findAllByOrderByPriceDesc();
	    model.addAttribute("products",products);
		return products;
	}
	
	@GetMapping("/pasc")
	public  @ResponseBody List<Product> priceAsc(Model model) {
		List<Product> products = pr.findAllByOrderByPriceAsc();
	    model.addAttribute("products",products);
		return products;
	}
	
	
	@GetMapping("/odesc")
	public  @ResponseBody List<Product> orderDesc(Model model) {
		List<Product> products = pr.findAllByOrderByOrderDesc();
	    model.addAttribute("products",products);
		return products;
	}
	
	@GetMapping("/makedesc")
	public  @ResponseBody List<Product> makeDesc(Model model) {
		List<Product> products = pr.findAllByOrderByMakeDesc();
	    model.addAttribute("products",products);
		return products;
	}
	
}
