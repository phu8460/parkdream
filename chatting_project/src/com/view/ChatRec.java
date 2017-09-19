package com.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.StringTokenizer;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.model.EchoClient;
import com.model.EchoClientThread;
import com.model.EchoServerThread;
import com.vo.FriendVO;

public class ChatRec extends JFrame implements ActionListener {
	//선언부
	JLabel 		jl_title 	= new JLabel("답장화면");
	JTextField 	jtf_uid 	= new JTextField(15);
	JTextArea 	jta_msg 	= new JTextArea(15,10);
	JButton 	jbtn_ok 	= new JButton("답장");
	JButton 	jbtn_no 	= new JButton("취소"); 	
	
	ChatSend		 cs	 = null;
	EchoClient  	 ec	 = null;
	FriendVO		 fvo = null;
	EchoClientThread ect = null;
	EchoServerThread est = null;
	
	String yourId=null;
	String myId=null;
	
	Color pink = new Color(255,235,254);
	Color pink2 = new Color(255,217,236);
	// 폰트 설정
	String ft_name = "함초롬바탕";
	Font ft_jt_friends  = new Font(ft_name,Font.BOLD,22); //테이블 머리 적용
	Font ft_jt_friends2 = new Font(ft_name,Font.PLAIN,20); //테이블 데이터 적용
	Font ft_title = new Font(ft_name,Font.BOLD,25); //테이블 데이터 적용
	
	
	public ChatRec(){
		initDisplay();
	}
	public ChatRec(EchoClient ec, FriendVO pvo)  {
		this.ec		= ec;
		this.fvo	= pvo;
		//initDisplay();	
		jtf_uid.setText(pvo.getYourId());

	}
	
	public ChatRec(String myId, String yourId, String sendMsg, FriendVO pvo, EchoClient ec) {
		this.fvo = pvo;
		System.out.println("charRec : "+myId+","+yourId+","+sendMsg);
		initDisplay();
		this.setTitle(myId+"님의 쪽지");
		jtf_uid.setText(yourId);
		jtf_uid.setEditable(false);
		this.setLocation(600,500);
		jta_msg.append(sendMsg);
		
		fvo.setYourId(yourId);
		fvo.setMyId(myId);
		this.yourId=yourId;
		this.myId=myId;
		this.ec = ec;
	}
	//화면부
	public void initDisplay(){
	    this.setLayout(null);
	      
	    jl_title.setBounds(170,20,150,40);
	    this.add(jl_title);
	    jtf_uid.setBounds(30,80,250,30);
	    this.add(jtf_uid);
	    jta_msg.setBounds(30,130,250,100);
	    this.add(jta_msg);
	    jbtn_ok.setBounds(330, 100, 100, 40);
	    this.add(jbtn_ok);
	    jbtn_no.setBounds(330, 170, 100, 40);
	    this.add(jbtn_no);
	    this.setSize(500,300);
	    this.setVisible(true);
	    this.setResizable(false); 
		jl_title.setFont(ft_title);
		jtf_uid.setFont(ft_jt_friends);
		jta_msg.setFont(ft_jt_friends2);
		jbtn_ok.setFont(ft_jt_friends2);
		jbtn_no.setFont(ft_jt_friends2);

		jbtn_ok.setBackground(Color.white);
		jbtn_no.setBackground(Color.white);
		
		
		this.getContentPane().setBackground(pink);
	    
	    jbtn_ok.addActionListener(this);
	    jbtn_no.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
	   Object obj = e.getSource();
	   //보내기
	   if(obj==jbtn_ok){
		   fvo.setYourId(myId);
		   fvo.setMyId(yourId);
		   new ChatSend(fvo,ec);
		   this.dispose();
	   }
	   //취소
	   else if(obj==jbtn_no){
		   this.dispose();
	   }
   }
}

