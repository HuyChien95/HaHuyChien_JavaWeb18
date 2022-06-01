package com.devpro.javaweb18.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_advisory")
public class Advisories extends BaseEntity{

	@Column(name = "title", length = 1000, nullable = false)
	private String title;
	
	@Lob
	@Column(name = "content", nullable = false, columnDefinition = "LONGTEXT")
	private String content;
	
	@Column(name = "seo", length = 1000, nullable = true)
	private String Seo;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Categories categories;
	
	@Column(name = "avatar", nullable = true)
	private String avatar;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSeo() {
		return Seo;
	}

	public void setSeo(String seo) {
		Seo = seo;
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
}
