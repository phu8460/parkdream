package com.model;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class EchoServer extends JFrame{
	//선언부
	//////////화면처리관련 코드 추가//////////
	JTextArea    jta_log = new JTextArea();
	JScrollPane   jsp_log = 
			new JScrollPane(jta_log
			               ,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED
			              ,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	ServerSocket server = null;
	Socket       client = null;
	ArrayList<EchoServerThread> chatList = null;
	Vector<String> roomList = null;
	EchoServerThread esThread = null;
/*	ObjectInputStream ois = null;
	ObjectOutputStream oos = null;*/
	boolean isStop = false;
	
	//생성자
	public EchoServer(int port){
		chatList = 
				new ArrayList<EchoServerThread>();
        roomList = new Vector<String>();

		initDisplay();
		try {
			server = new ServerSocket(port);
		} catch (Exception e) {
			//stack메모리에 남겨지는 에러코드 메시지출력
			e.printStackTrace();
			//자바가상머신과 연결통로를 끊는다.
			System.exit(0);
		}
		System.out.println("Echo Server Start Success!!!");
		while(!isStop){
			try {
				System.out.println("클라이언트 기다리는중.......");
				client = server.accept();
				if(client!=null){
					System.out.println
					("클라이언트측  IP주소 : "
					+client.getInetAddress().getHostAddress());
					esThread = new EchoServerThread(this);
					esThread.start();
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception : "+e.getMessage());
			}
		}
	}
	//화면처리부
	public void initDisplay(){
		this.setTitle("서버 로그 출력창");
		jta_log.append("Server Ready....\n");
		this.add("Center",jsp_log);
		this.setSize(500, 400);
		this.setVisible(true);
	}
    public void addRoom(String maxcount,String roomname, String roomopen){
    	roomList.add(maxcount);
    	roomList.add(roomname);
    	roomList.add(roomopen);
    }
    
	//메인메소드
	public static void main(String[] args) {
		//insert here - 생성자 호출하기
		new EchoServer(7171);
	}

}

