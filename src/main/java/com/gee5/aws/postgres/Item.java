package com.gee5.aws.postgres;

public class Item {

	private int id = -1;
	private int ref_id = -1;
	private String name = "";

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRef_id() {
		return ref_id;
	}
	public void setRef_id(int ref_id) {
		this.ref_id = ref_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}

