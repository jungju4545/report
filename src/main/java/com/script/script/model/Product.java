package com.script.script.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="pid")
	private String make;
	
	private String p_name;
	@Column(name="p_order")
	private int order;
	private String uid;
	private String u_age;
	@Column(name="p_prise")
	private int price;
	@Column(name="p_type")
	private String category; // 언더바가 있는 컬럼 관리할때
	private String createTime;
	
}
