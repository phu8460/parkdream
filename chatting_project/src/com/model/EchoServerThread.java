package com.model;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.StringTokenizer;

public class EchoServerThread extends Thread {
	EchoServer es = null;
	//EchoServer���� �ʿ��� Ŭ������ ����� �����ϱ�
	Socket socket = null;
	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	String chatName = null;
	//������ �����ϱ�
	public EchoServerThread(){
	}
	public EchoServerThread(EchoServer es){
		this.es = es;
		socket = es.client;
		try {
			oos = new ObjectOutputStream
					(socket.getOutputStream());
			ois = new ObjectInputStream
					(socket.getInputStream());
		//100#��ȭ��
			String msg = (String)ois.readObject();
		//������ �α�â ������� �޽��� ����ϱ�
			StringTokenizer st = 
					new StringTokenizer(msg,"#");
			st.nextToken();//100
			chatName = st.nextToken();//��ȭ��
			es.jta_log.append(chatName+"���� ����.\n");
			//���� �����ڿ��Ե� ��ȭ���� �˷��־�� ��.
			for(EchoServerThread est:es.chatList){
				String currentName 
						= est.chatName;
				this.send
				(Protocol.ROOM_IN+"#"+currentName);
			}
			//��ȭ�� �����ϰ� �ִ� �ٸ� Ŭ���̾�Ʈ���Ե� ������
			//����� �˷��� �Ѵ�.
			es.chatList.add(this);
			this.broadCasting(msg);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//��ȭ�濡 ������ ��� ģ���� ������ ���ͼ� �����Ѵ�.
	public void broadCasting(String message){
		for(EchoServerThread est:es.chatList){
			est.send(message);
		}
	}
	//��ȭ�濡 ������ ģ���鿡�� ������ ���ϴ� �ڵ���.
	//�ӼӸ��� ���� 1:1��ȭ���� ����Ͽ� send�޼ҵ带
	//�и���.
	public void send(String message){
		try {
			oos.writeObject(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//run�޼ҵ�� ���� ȣ�� �ɱ��?
	//EchoServerThread.start()ȣ������ ��
	@Override
	public synchronized void run(){
		//while���� Ż���� �� ����� ����
		boolean isStop = false;
		try {
			while(!isStop){
				String msg = 
					(String)ois.readObject();
				
				System.out.println("ServerThread : "+msg);
				
				es.jta_log.append(msg+"\n");
				es.jta_log.setCaretPosition(es.jta_log.getDocument().getLength());
				StringTokenizer st = null;
				int protocol = 0;
				if(msg!=null){
					st =
					new StringTokenizer(msg,"#");
					protocol = 
					Integer.parseInt(st.nextToken());
				}
				
				switch(protocol){
				case Protocol.TALK:{
					String nickName = st.nextToken();
					String msg2 = st.nextToken();
					String fontColor = st.nextToken();
					broadCasting(Protocol.TALK
							 +"#"+nickName
							 +"#"+msg2
							 +"#"+fontColor);
				}break;
				case Protocol.CHANGE:{
					String nickName = st.nextToken();
					String afterName = st.nextToken();
					broadCasting(Protocol.CHANGE+"#"+nickName+"#"+afterName);
					this.chatName = afterName;
				}break;

				case Protocol.ROOM_OUT:{
					String nickName = st.nextToken();
					broadCasting(Protocol.ROOM_OUT
							 +"#"+nickName);
					es.chatList.remove(this);
				}break;
				case Protocol.WHISPER:{
					String nickName = st.nextToken();
					String otherName = st.nextToken();
					String message = st.nextToken();
					for(EchoServerThread est:es.chatList){
						if(otherName.equals(est.chatName)){
							est.send(Protocol.WHISPER+"#"+nickName+"#"+otherName+"#"+message);
						}
					}
					this.send(Protocol.WHISPER+"#"+nickName+"#"+otherName+"#"+message);
				}break;
				case Protocol.SendMsg:{
					String id		= st.nextToken();
					String Myid 	= st.nextToken();
					String sendmsg  = st.nextToken(); 
					broadCasting(Protocol.SendMsg+"#"+id+"#"+Myid+"#"+sendmsg);
				}break;
				
/*				case Protocol.ROOM_MAKE:{
					System.out.println("st room make");
					String master = st.nextToken();
					String maxcount = st.nextToken();
					String roomopen = st.nextToken();
					String roomname = st.nextToken();
					String roompw = st.nextToken();
					
					for(EchoServerThread est:es.chatList){
						est.send(Protocol.ROOM_MAKE
								+"#"+master
								+"#"+maxcount
								+"#"+roompw
								+"#"+roomopen
								+"#"+roomname);
					}
					es.addRoom(maxcount,roomname,roomopen);
					broadCasting(Protocol.ROOM_MAKE
							+"#"+master
							+"#"+maxcount
							+"#"+roomname
							+"#"+roomopen);
					
					// �׽�Ʈ
					es.jta_log.append(Protocol.ROOM_MAKE
							+"#"+master
							+"#"+maxcount
							+"#"+roomname
							+"#"+roomopen);
					es.jta_log.setCaretPosition(es.jta_log.getDocument().getLength());

				}break;*/
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}

