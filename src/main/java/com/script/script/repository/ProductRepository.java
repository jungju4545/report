package com.script.script.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.script.script.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}
