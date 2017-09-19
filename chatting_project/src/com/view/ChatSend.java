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
	// �����
	JLabel 		jl_title = new JLabel("����������");
	JTextField 	jtf_uid  = new JTextField(15);
	JTextArea 	jta_msg  = new JTextArea(15,10);
	JButton 	jbtn_ok  = new JButton("����");
	JButton 	jbtn_no  = new JButton("���");
	Font 		font 	 = new Font("�ü�",0,30);
	
	EchoClient 			ec = null;
	ChatMain			cm	= null;
	FriendVO 			fvo = null;
	EchoServer 			es	= null;
	EchoServerThread 	est = null;
	String 				id  = null; 
	
	Color pink = new Color(255,235,254);
	Color pink2 = new Color(255,217,236);
	// ��Ʈ ����
	String ft_name = "���ʷҹ���";
	Font ft_jt_friends  = new Font(ft_name,Font.BOLD,22); //���̺� �Ӹ� ����
	Font ft_jt_friends2 = new Font(ft_name,Font.PLAIN,20); //���̺� ������ ����
	Font ft_title = new Font(ft_name,Font.BOLD,25); //���̺� ������ ����
	
	// ������
	// public ChatSend(){}
	JLabel blank = new JLabel(" ");
	public ChatSend(){}
	
	public ChatSend(EchoClient ec, FriendVO pvo)  {    //�����ؼ� ����������
		this.ec		= ec;
		this.fvo	= pvo;
		initDisplay();	
		jtf_uid.setText(pvo.getYourId());
		jtf_uid.setEditable(false);

	}
	public ChatSend(FriendVO fvo, EchoClient ec) { // ����
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
		this.setTitle("����������");
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
		
		//�̺�Ʈ ó�� 
		jbtn_ok.addActionListener(this);
		jbtn_no.addActionListener(this);
}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		String msg = jta_msg.getText(); 
		
		//������
		   if(obj==jbtn_ok){
			 try {
				 ec.oos.writeObject(Protocol.SendMsg
								  +"#"+fvo.getMyId()
								  +"#"+fvo.getYourId()
								  +"#"+msg);
				System.out.println("�޼��������� :"+ fvo.getMyId()
				                  +" ���� "+fvo.getYourId()+" �� ���� "+ " " +msg+" (��)�� ���� �Ͽ���.");
				
				
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 this.dispose();
			 
		    }
		//���
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
