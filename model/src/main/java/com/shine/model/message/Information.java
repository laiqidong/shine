package com.shine.model.message;

import javax.persistence.*;
import java.util.Date;

/**
 * DepartmentClassify entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "INFORMATION")
//@SequenceGenerator(name = "SEQ_INFORMATION", sequenceName = "SEQ_INFORMATION", allocationSize = 1)
public class Information {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String infoTitle; // 标题
	private String content; // 内容
	private Date infoDate; // 时间
	private String author; // 作者
	private Integer typeId; // 类型
	private String des; // 简介
	private Integer status;

	// Constructors

	/** default constructor */
	public Information() {
	}
	
	public Information setInformation(Information t)
	{
		this.id = t.getId();
		this.infoTitle = t.getInfoTitle();
		this.content=t.getContent();
		this.author = t.getAuthor();
		this.des = t.getDes();
		this.typeId = t.getTypeId();
		this.status = t.getStatus();
		return this;
	}


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getInfoTitle() {
		return infoTitle;
	}

	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getInfoDate() {
		return infoDate;
	}

	public void setInfoDate(Date infoDate) {
		this.infoDate = infoDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	

}