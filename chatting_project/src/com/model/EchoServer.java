package com.model;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class EchoServer extends JFrame{
	//�����
	//////////ȭ��ó������ �ڵ� �߰�//////////
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
	
	//������
	public EchoServer(int port){
		chatList = 
				new ArrayList<EchoServerThread>();
        roomList = new Vector<String>();

		initDisplay();
		try {
			server = new ServerSocket(port);
		} catch (Exception e) {
			//stack�޸𸮿� �������� �����ڵ� �޽������
			e.printStackTrace();
			//�ڹٰ���ӽŰ� ������θ� ���´�.
			System.exit(0);
		}
		System.out.println("Echo Server Start Success!!!");
		while(!isStop){
			try {
				System.out.println("Ŭ���̾�Ʈ ��ٸ�����.......");
				client = server.accept();
				if(client!=null){
					System.out.println
					("Ŭ���̾�Ʈ��  IP�ּ� : "
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
	//ȭ��ó����
	public void initDisplay(){
		this.setTitle("���� �α� ���â");
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
    
	//���θ޼ҵ�
	public static void main(String[] args) {
		//insert here - ������ ȣ���ϱ�
		new EchoServer(7171);
	}

}

