package com.model;

import java.util.StringTokenizer;
import java.util.Vector;
import java.util.concurrent.SynchronousQueue;

import javax.swing.text.SimpleAttributeSet;

import com.view.ChatMain;
import com.view.ChatRec;
import com.vo.FriendVO;

public class EchoClientThread extends Thread {
	EchoClient ec = null;
	ChatMain cm = null;
	
	StringTokenizer st = null;
	Vector<String> roomInfo = 
			new Vector<String>();
	FriendVO pvo = new FriendVO();
	
	public EchoClientThread(EchoClient ec, ChatMain cm){
		this.ec = ec;
		this.cm = cm;
	}
	//클라이언트측의 run메소드에서는 서버에서 전달된 
	//메시지를 읽어서 화면에 처리함.
	@Override
	public synchronized void run(){
		String message = "";
		boolean isStop = false;
		while(!isStop){
			try {
				message = 
						(String)ec.ois.readObject();
				System.out.println(message);
				int protocol = 0;
				if(message !=null){
		//message : 100#강감찬			
					st = 
					new StringTokenizer(message,"#");
					protocol = 
					Integer.parseInt(st.nextToken());
				}
				switch(protocol){
				case Protocol.ROOM_IN:{
					String nickName = st.nextToken();
					Vector<String> v_names = 
							new Vector<String>();
					v_names.add(nickName);
					cm.dtm_name.addRow(v_names);
					cm.sd_display.insertString(cm.sd_display.getLength()
			                  , "#####"+nickName+"님이 입장#####\n"
			                  , new SimpleAttributeSet());
					 // cm.jta_display.append(message+"\n");
    			    cm.jtp_display.setCaretPosition(cm.sd_display.getLength());
				}break;
				case Protocol.TALK:{
    		    	String nickName = st.nextToken();
					String msg2 = st.nextToken();
					String fontColor = st.nextToken();
					SimpleAttributeSet sas = cm.makeAttribute(fontColor);
					try {
						cm.sd_display.insertString(cm.sd_display.getLength()
								                  , "["+nickName+"] : "+msg2+"\n"
								                  , sas);
					}
    			    catch (Exception e) {
						
					}
    			    cm.jtp_display.setCaretPosition(cm.sd_display.getLength());
				}break;		
				case Protocol.CHANGE:{
					String nickName = st.nextToken();
    		    	String afterName = st.nextToken();
    		    	//테이블에서 변경전 대화명을 찾아서 변경후 로 변경한다.
    		    	for(int i=0;i<cm.dtm_name.getRowCount();i++) {
    		    		//대화명 변경전에 현재 테이블에서 가져온 대화명을 받음.
    		    		String n1 = (String)cm.dtm_name.getValueAt(i,0);
    		    		if(n1.equals(nickName)) {
    		    			//변경할 대화명으로 테이블에 대화명 변경
    		    			cm.dtm_name.setValueAt(afterName,i,0);
    		    			break;
    		    		} ///// end of if
    		    	} ///// end of for
    		    	try {
						cm.sd_display.insertString(cm.sd_display.getLength()
								                  , nickName+"님이 "+afterName+"님으로 변경 되었습니다.\n"
								                  , new SimpleAttributeSet());
					}
    			    catch (Exception e) {
						
					}
    		    	cm.jtp_display.setCaretPosition(cm.sd_display.getLength());
    		    	//채팅 팝업창에 타이틀바에도 대화명을 변경 한다.
    		    	if(nickName.equals(cm.nickName)) {
    		    		cm.nickName = afterName;
    		    	} ///// end of if
    	  		}break;
	
				case Protocol.ROOM_OUT:{
					String name = st.nextToken();
    		    	try {
						cm.sd_display.insertString(cm.sd_display.getLength()
								                  , name+"님이 퇴장 하였습니다.\n"
								                  , new SimpleAttributeSet());
					}
    			    catch (Exception e) {
						
					}
    		    	cm.jtp_display.setCaretPosition(cm.sd_display.getLength());
    		    	//테이블에서 나가는 회원의 이름 제거하기
    		    	for(int i=0;i<cm.dtm_name.getRowCount();i++) {
    		    	//테이블에 등록되어 있는 대화명 접근하기
    		    		String tname = (String)cm.dtm_name.getValueAt(i,0);
    		    		if(name.equals(tname)) {
    		    			cm.dtm_name.removeRow(i);
    		    			break;
    		    		}
    		    	} ///// end of for
				}break;
				case Protocol.WHISPER:{
    		    	String fromName = st.nextToken();
    		    	String toName = st.nextToken();
    		    	String whisperMsg = st.nextToken();
    		    	try {
						cm.sd_display.insertString(cm.sd_display.getLength()
								                  , "["+fromName+"님이"+toName+"님에게]"+whisperMsg+"\n"
								                  , new SimpleAttributeSet());
					}
    			    catch (Exception e) {
						
					}
    		    	cm.jtp_display.setCaretPosition(cm.sd_display.getLength());
					}break;
				
				case Protocol.SendMsg:{
					String myId 	= st.nextToken(); // 발신자
					String youId	= st.nextToken(); // 수신자
					String sendMsg  = st.nextToken(); // 메시지
					String yourId = cm.getTitle();
					System.out.println(cm.getTitle()+","+youId);
					
					if(yourId.equals(youId)){
						new ChatRec(myId,yourId,sendMsg,pvo,ec);
					}
				}break;
	
				}////////end of switch
			} catch (Exception e) {
				// TODO: handle exception
			}////////end of try..catch
		}////////////end of while
	}////////////////end of run
}






