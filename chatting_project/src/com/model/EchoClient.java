package com.model;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import com.view.ChatMain;
import com.vo.ChatVO;

public class EchoClient{
	//대화명 입력 받기
	String ip ="";
	int    port=0;
	Socket mySocket = null;
	ObjectInputStream ois = null;
	public ObjectOutputStream oos = null;
	String id =null; 
	ChatVO pvo = null;
	EchoClientThread ect = null;
	ChatMain cm = null;

	public EchoClient(String ip, int port, String id) throws Exception{
		this.ip = ip;
		this.port = port;	
		this.id = id;	
		cm = new ChatMain(id,this);
		mySocket = new Socket(ip,port);
		oos = new ObjectOutputStream(
				mySocket.getOutputStream());
		ois = new ObjectInputStream(
				mySocket.getInputStream());
		
		oos.writeObject
		(Protocol.ROOM_IN+"#"+cm.nickName);
		//서버측에 메시지 보내기
		EchoClientThread ect = 
				new EchoClientThread(this,cm);
		ect.start();
	}

	public void send(String msg){
		try {
			oos.writeObject(Protocol.TALK
					    +"#"+cm.nickName+"#"+msg);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}



