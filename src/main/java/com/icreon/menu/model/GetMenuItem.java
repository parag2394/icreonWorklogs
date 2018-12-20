package com.icreon.menu.model;

public class GetMenuItem 
{
private int menu_id;
public int getMenu_id() {
	return menu_id;
}
public void setMenu_id(int menu_id) {
	this.menu_id = menu_id;
}
public String getText_p() {
	return text_p;
}
public void setText_p(String text_p) {
	this.text_p = text_p;
}
public String getDescription_d() {
	return description_d;
}
public void setDescription_d(String description_d) {
	this.description_d = description_d;
}
public int getParent_id() {
	return parent_id;
}
public void setParent_id(int parent_id) {
	this.parent_id = parent_id;
}
public String getNav_url() {
	return nav_url;
}
public void setNav_url(String nav_url) {
	this.nav_url = nav_url;
}
public int getOrder_by() {
	return order_by;
}
public void setOrder_by(int order_by) {
	this.order_by = order_by;
}
private String text_p;
private String description_d;
private int parent_id;
private String nav_url;
private int order_by;
}
