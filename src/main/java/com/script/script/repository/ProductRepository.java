package com.script.script.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.script.script.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
//	@Query(value="SELECT * FROM product WHERE p_type=?",nativeQuery = true)
	List<Product> findByCategory(String category);
//	@Query(value="SELECT * FROM product ORDER BY price DESC",nativeQuery = true)
	public List<Product> findAllByOrderByPriceDesc();
	public List<Product> findAllByOrderByPriceAsc();
	public List<Product> findAllByOrderByOrderDesc();
	public List<Product> findAllByOrderByOrderAsc();
	public List<Product> findAllByOrderByCreateTimeDesc();
	public List<Product> findAllByOrderByCreateTimeAsc();
}
