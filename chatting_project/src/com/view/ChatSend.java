package com.view;

import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.PlainDocument;

import com.model.EchoClient;
import com.model.EchoServer;
import com.model.EchoServerThread;
import com.model.Protocol;
import com.vo.FriendVO;


public class ChatSend extends JFrame implements ActionListener{
	// 선언부
	JLabel 		jl_title = new JLabel("쪽지보내기");
	JTextField 	jtf_uid  = new JTextField(15);
	JTextArea 	jta_msg  = new JTextArea(15,10);
	JButton 	jbtn_ok  = new JButton("전송");
	JButton 	jbtn_no  = new JButton("취소");
	Font 		font 	 = new Font("궁서",0,30);
	
	EchoClient 			ec = null;
	ChatMain			cm	= null;
	FriendVO 			fvo = null;
	EchoServer 			es	= null;
	EchoServerThread 	est = null;
	String 				id  = null; 
	
	Color pink = new Color(255,235,254);
	Color pink2 = new Color(255,217,236);
	// 폰트 설정
	String ft_name = "함초롬바탕";
	Font ft_jt_friends  = new Font(ft_name,Font.BOLD,22); //테이블 머리 적용
	Font ft_jt_friends2 = new Font(ft_name,Font.PLAIN,20); //테이블 데이터 적용
	Font ft_title = new Font(ft_name,Font.BOLD,25); //테이블 데이터 적용
	
	// 생성자
	// public ChatSend(){}
	JLabel blank = new JLabel(" ");
	public ChatSend(){}
	
	public ChatSend(EchoClient ec, FriendVO pvo)  {    //선택해서 쪽지보내기
		this.ec		= ec;
		this.fvo	= pvo;
		initDisplay();	
		jtf_uid.setText(pvo.getYourId());
		jtf_uid.setEditable(false);

	}
	public ChatSend(FriendVO fvo, EchoClient ec) { // 답장
		this.ec=ec;
		this.fvo=fvo;
		initDisplay();
		jtf_uid.setText(fvo.getYourId());
		jtf_uid.setEditable(false);
		
	}
	ImageIcon icon = new ImageIcon("src/com/images/kosmos.jpg");
	JPanel jp_2 = new JPanel(){
		public void paintComponent(Graphics g) {
			g.drawImage(icon.getImage(), 0, 0, null);
		}
	};

	public void initDisplay() {
		this.setLayout(null);
		jl_title.setFont(font);
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
		this.setTitle("쪽지보내기");
		this.setSize(500,300);
		this.setVisible(true);
		this.setLocation(600,500);
		this.setResizable(false); 
		jl_title.setFont(ft_title);
		jtf_uid.setFont(ft_jt_friends);
		jta_msg.setFont(ft_jt_friends2);
		jbtn_ok.setFont(ft_jt_friends2);
		jbtn_no.setFont(ft_jt_friends2);

		jbtn_ok.setBackground(Color.white);
		jbtn_no.setBackground(Color.white);
		
		
		this.getContentPane().setBackground(pink);
		
		jta_msg.setLineWrap(true);
		jta_msg.setDocument(new textlimit(150));
		jtf_uid.setDocument(new textlimit(20));
		
		//이벤트 처리 
		jbtn_ok.addActionListener(this);
		jbtn_no.addActionListener(this);
}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		String msg = jta_msg.getText(); 
		
		//보내기
		   if(obj==jbtn_ok){
			 try {
				 ec.oos.writeObject(Protocol.SendMsg
								  +"#"+fvo.getMyId()
								  +"#"+fvo.getYourId()
								  +"#"+msg);
				System.out.println("메세지보내기 :"+ fvo.getMyId()
				                  +" 님이 "+fvo.getYourId()+" 님 에게 "+ " " +msg+" (을)를 전송 하였다.");
				
				
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 this.dispose();
			 
		    }
		//취소
		if(obj==jbtn_no){
			this.dispose();
		}
	}
	//######################################################
	class textlimit extends PlainDocument {
	private int limit;
	public textlimit(int limit)
	{
		super();
		this.limit = limit;
	}
	public void insertString(int offset, String str, AttributeSet attr) throws BadLocationException
		{
		if(str == null)
			return;
		if(getLength() + str.length() <= limit)
			super.insertString(offset, str, attr);
		} 
	}
}
