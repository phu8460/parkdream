package com.vo;

import com.view.ChatMain;

public class FriendVO {
	//############################//
	private String yourId 		= null;
	private String myId 	= null;
	private String msg		= null;
	private int	   cmd		= 0;		
	private int	   index	= 0;
	
	//#############################//
	private String pw 		= null;
	private String name 	= null;
	private String hp 	 	= null;
	private String address  = null;
	private String gender  	= null;
	private String email  	= null;
	private String comments = null;
	private String command  = null;
	private int    result 	= 0;
	private ChatMain PCM = null;
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public ChatMain getPCM() {
		return PCM;
	}
	public void setPCM(ChatMain pCM) {
		PCM = pCM;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCmd() {
		return cmd;
	}
	public void setCmd(int cmd) {
		this.cmd = cmd;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getYourId() {
		return yourId;
	}
	public void setYourId(String yourId) {
		this.yourId = yourId;
	}
	public String getMyId() {
		return myId;
	}
	public void setMyId(String myId) {
		this.myId = myId;
	}
}
