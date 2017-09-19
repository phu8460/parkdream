package com.vo;

import java.util.Vector;

public class AddressBookVO {
   private int seq_no = 0;
   private String add_name = null;
   private String add_gender = null;
   private String add_birth = null;
   private String add_contact = null;
   private String add_email = null;
   private String add_address = null;
   private String add_group = null;
   private String add_note = null;
   private String command=null;
   private String where=null;
   private int combo=-1;
   
   private AddressBookVO[] select=null;

public int getSeq_no() {
	return seq_no;
}

public void setSeq_no(int seq_no) {
	this.seq_no = seq_no;
}

public String getAdd_name() {
	return add_name;
}

public void setAdd_name(String add_name) {
	this.add_name = add_name;
}

public String getAdd_gender() {
	return add_gender;
}

public void setAdd_gender(String add_gender) {
	this.add_gender = add_gender;
}

public String getAdd_birth() {
	return add_birth;
}

public void setAdd_birth(String add_birth) {
	this.add_birth = add_birth;
}

public String getAdd_contact() {
	return add_contact;
}

public void setAdd_contact(String add_contact) {
	this.add_contact = add_contact;
}

public String getAdd_email() {
	return add_email;
}

public void setAdd_email(String add_email) {
	this.add_email = add_email;
}

public String getAdd_address() {
	return add_address;
}

public void setAdd_address(String add_address) {
	this.add_address = add_address;
}

public String getAdd_group() {
	return add_group;
}

public void setAdd_group(String add_group) {
	this.add_group = add_group;
}

public String getAdd_note() {
	return add_note;
}

public void setAdd_note(String add_note) {
	this.add_note = add_note;
}

public String getCommand() {
	return command;
}

public void setCommand(String command) {
	this.command = command;
}

public String getWhere() {
	return where;
}

public void setWhere(String where) {
	this.where = where;
}

public int getCombo() {
	return combo;
}

public void setCombo(int combo) {
	this.combo = combo;
}

public AddressBookVO[] getSelect() {
	return select;
}

public void setSelect(AddressBookVO[] select) {
	this.select = select;
}
   




}