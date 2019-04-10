package com.pojo;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity(name="MapperClass")
public class MapperClass {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="email")
	private String email;
	
	@Column(name="upassword")
	private String password;
	
	@Lob
	@Column(name="profilepic")
	private Blob profile_pic;
	
	
	
	public Blob getProfile_pic() {
		return profile_pic;
	}

	public void setProfile_pic(Blob profile_pic) {
		this.profile_pic = profile_pic;
	}

	public MapperClass()
	{
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
	
	@Override
	public String toString() {
		return "MapperClass [email=" + email + ", password=" + password + "]";
	}

	
	
}
