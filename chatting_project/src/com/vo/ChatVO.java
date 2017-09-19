package com.vo;

import com.view.ChatMain;

public class ChatVO {
	private String id 		= null;
	private int    seq_no   = 0;
	private String roomname = null;
	private int    no 		= 0;
	private String command  = null;
	private String open  	= null;
	private String pw  		= null;
	private int    result 	= 0;
	private ChatMain PCM = null;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(int seq_no) {
		this.seq_no = seq_no;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public ChatMain getPCM() {
		return PCM;
	}
	public void setPCM(ChatMain pCM) {
		PCM = pCM;
	}


}
