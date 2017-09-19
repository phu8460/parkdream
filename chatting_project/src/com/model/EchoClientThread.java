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
	//Ŭ���̾�Ʈ���� run�޼ҵ忡���� �������� ���޵� 
	//�޽����� �о ȭ�鿡 ó����.
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
		//message : 100#������			
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
			                  , "#####"+nickName+"���� ����#####\n"
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
    		    	//���̺��� ������ ��ȭ���� ã�Ƽ� ������ �� �����Ѵ�.
    		    	for(int i=0;i<cm.dtm_name.getRowCount();i++) {
    		    		//��ȭ�� �������� ���� ���̺��� ������ ��ȭ���� ����.
    		    		String n1 = (String)cm.dtm_name.getValueAt(i,0);
    		    		if(n1.equals(nickName)) {
    		    			//������ ��ȭ������ ���̺� ��ȭ�� ����
    		    			cm.dtm_name.setValueAt(afterName,i,0);
    		    			break;
    		    		} ///// end of if
    		    	} ///// end of for
    		    	try {
						cm.sd_display.insertString(cm.sd_display.getLength()
								                  , nickName+"���� "+afterName+"������ ���� �Ǿ����ϴ�.\n"
								                  , new SimpleAttributeSet());
					}
    			    catch (Exception e) {
						
					}
    		    	cm.jtp_display.setCaretPosition(cm.sd_display.getLength());
    		    	//ä�� �˾�â�� Ÿ��Ʋ�ٿ��� ��ȭ���� ���� �Ѵ�.
    		    	if(nickName.equals(cm.nickName)) {
    		    		cm.nickName = afterName;
    		    	} ///// end of if
    	  		}break;
	
				case Protocol.ROOM_OUT:{
					String name = st.nextToken();
    		    	try {
						cm.sd_display.insertString(cm.sd_display.getLength()
								                  , name+"���� ���� �Ͽ����ϴ�.\n"
								                  , new SimpleAttributeSet());
					}
    			    catch (Exception e) {
						
					}
    		    	cm.jtp_display.setCaretPosition(cm.sd_display.getLength());
    		    	//���̺��� ������ ȸ���� �̸� �����ϱ�
    		    	for(int i=0;i<cm.dtm_name.getRowCount();i++) {
    		    	//���̺� ��ϵǾ� �ִ� ��ȭ�� �����ϱ�
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
								                  , "["+fromName+"����"+toName+"�Կ���]"+whisperMsg+"\n"
								                  , new SimpleAttributeSet());
					}
    			    catch (Exception e) {
						
					}
    		    	cm.jtp_display.setCaretPosition(cm.sd_display.getLength());
					}break;
				
				case Protocol.SendMsg:{
					String myId 	= st.nextToken(); // �߽���
					String youId	= st.nextToken(); // ������
					String sendMsg  = st.nextToken(); // �޽���
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






