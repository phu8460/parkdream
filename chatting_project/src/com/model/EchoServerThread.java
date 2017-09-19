package com.model;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.StringTokenizer;

public class EchoServerThread extends Thread {
	EchoServer es = null;
	//EchoServer에서 필요한 클래스를 멤버로 선언하기
	Socket socket = null;
	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	String chatName = null;
	//생성자 정의하기
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
		//100#대화명
			String msg = (String)ois.readObject();
		//서버의 로그창 입장관련 메시지 출력하기
			StringTokenizer st = 
					new StringTokenizer(msg,"#");
			st.nextToken();//100
			chatName = st.nextToken();//대화명
			es.jta_log.append(chatName+"님이 입장.\n");
			//이후 참가자에게도 대화명을 알려주어야 함.
			for(EchoServerThread est:es.chatList){
				String currentName 
						= est.chatName;
				this.send
				(Protocol.ROOM_IN+"#"+currentName);
			}
			//대화에 참여하고 있는 다른 클라이언트에게도 입장한
			//사실을 알려야 한다.
			es.chatList.add(this);
			this.broadCasting(msg);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//대화방에 참여한 모든 친구들 정보를 얻어와서 전송한다.
	public void broadCasting(String message){
		for(EchoServerThread est:es.chatList){
			est.send(message);
		}
	}
	//대화방에 참여한 친구들에게 실제로 말하는 코드임.
	//귓속말과 같은 1:1대화등을 고려하여 send메소드를
	//분리함.
	public void send(String message){
		try {
			oos.writeObject(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//run메소드는 언제 호출 될까요?
	//EchoServerThread.start()호출했을 때
	@Override
	public synchronized void run(){
		//while문을 탈출할 때 사용할 변수
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
					
					// 테스트
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

