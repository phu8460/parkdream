package com.view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JColorChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.SwingConstants;
import javax.swing.border.LineBorder;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import javax.swing.text.DefaultStyledDocument;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyleContext;
import javax.swing.text.StyledDocument;

import com.controller.FriendController;
import com.model.EchoClient;
import com.model.Protocol;
import com.vo.ChatVO;
import com.vo.FriendVO;

public class ChatMain extends JFrame implements ActionListener{
	String path = "D:\\dev_kosmo\\catting_project\\src\\com\\images\\";
	// �����
	JPanel jp_left = new JPanel();
	JPanel jp_right1 = new JPanel();
	JPanel jp_right3 = new JPanel();
	ImageIcon icon = new ImageIcon(path+"main.jpg");
    JPanel jp_right2 = new JPanel();

	JButton jbtn_msg = new JButton("����������");
	JButton jbtn_pchange = new JButton("�����ʺ���");
	JButton jbtn_in = new JButton("�������ϱ�");
	JButton jbtn_out = new JButton("�α׾ƿ�");
	
	String fcols[] = {"���̵�","����","������","����"};
	String fdata[][] = new String[0][fcols.length];
	DefaultTableModel dtm_friends 
				= new DefaultTableModel(fdata,fcols);
	JTable jt_friends = new JTable(dtm_friends);
	JScrollPane jsp_friends = new JScrollPane(jt_friends);
	
	EchoClient pec = null;
	ChatVO cvo = null;
	
	/*******************************************************/
	//ȭ��ó�� �ڵ� �߰�
		JPanel jp_chatting = new JPanel();
		//jp_first�������� jta_display, jp_south
		JPanel jp_first = new JPanel();
		//jp_second�������� Center JTable, 
		//South���� jp_second_south
		JPanel jp_second = new JPanel();
		String cols[] = {"��ȭ��"};
		String data[][] = new String[0][1];
		public DefaultTableModel dtm_name 
		= new DefaultTableModel(data,cols);
		JTable jt_name = new JTable(dtm_name);
		JScrollPane jsp_name = 
				new JScrollPane(jt_name
						       ,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED
				               ,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		//jp_second_south�������� ��ư 4�� �߰�
		JPanel jp_second_south = new JPanel();
		JButton jbtn_whisper = 
				new JButton("�ӼӸ�");
		JButton jbtn_change = 
				new JButton("��ȭ����");
		JButton jbtn_Color = 
				new JButton("�۾�������");
		JButton jbtn_exit = 
				new JButton("��ȭ����");
		public StyledDocument sd_display = new DefaultStyledDocument(new StyleContext());
		public JTextPane   jtp_display = new JTextPane(sd_display);
		JScrollPane jsp_display = new JScrollPane(jtp_display
					                             ,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED
					                             ,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		JPanel jp_south = new JPanel();
		JTextField jtf_msg = new JTextField();
		JButton jbtn_send = new JButton("����");
		
		public String nickName = null;
		
		FriendVO 	pvo = new FriendVO();
		EchoClient  ec = null;
		String 		id 	= null;
		
		String fontColor = "0";
		
		//��Ÿ���� �����ϴµ� �ʿ��� ��ü�߰�
	 /******************************************************/
		//-------------------------�����κ�---------------------------------
		//���̺� ���� ��� ����
		DefaultTableCellRenderer dtcr = new DefaultTableCellRenderer();
		DefaultTableCellRenderer dtcr2 = new DefaultTableCellRenderer();
		//���� ���� 
		Color pink = new Color(255,235,254);
		Color pink2 = new Color(255,217,236);
		// ��Ʈ ����
		String ft_name = "���ʷҹ���";
		Font ft_jt_friends  = new Font(ft_name,Font.BOLD,18); //���̺� �Ӹ� ����
		Font ft_jt_friends2 = new Font(ft_name,Font.PLAIN,16); //���̺� ������ ����
		
		//----------------------------------------------------------------

	// ������
	public ChatMain(){//initDisplay();
	}

	public ChatMain(String id, EchoClient pec) throws Exception{
		initDisplay();
		this.setTitle(id);
		nickName = JOptionPane.showInputDialog("����� ��ȭ���� �Է��ϼ���.");
		Friends_refreshData();
		this.id=id;
		this.pec=pec;
		pvo.setMyId(id);
	}
	public void initDisplay(){
		 /******************************************************/
	    jp_right2 = new JPanel(){
	        public void paintComponent(Graphics g) {
	            g.drawImage(icon.getImage(), 0, 0, null);
	        }
	    };
		
		this.addWindowListener(new WindowAdapter(){
			public void windowClosing(WindowEvent we){
				exitChat();
				System.exit(0);
			}
		});
		this.setResizable(false); 
		jbtn_send.addActionListener(this);
		jtf_msg.addActionListener(this);
		jp_chatting.setLayout(new GridLayout(1,2));
		//jp_first������ BorderLayout���� ������.
		jp_first.setLayout(new BorderLayout());
		//jp_first���� Center�� jsp_display
		jp_first.add("Center", jsp_display);
		//jp_first���� South�� jp_south������ġ
		jp_south.setLayout(new BorderLayout());
		jp_south.add("Center", jtf_msg);
		jp_south.add("East", jbtn_send);
		jp_first.add("South", jp_south);
		jp_chatting.add(jp_first);
		jp_second.setLayout(new BorderLayout());
		jp_second.add("Center", jsp_name);
		jp_second_south.setLayout
		(new GridLayout(2,2));
		jp_second_south.add(jbtn_whisper);
		jp_second_south.add(jbtn_change);
		jp_second_south.add(jbtn_Color);
		jp_second_south.add(jbtn_exit);
		jp_second.add("South", jp_second_south);
		jp_chatting.add(jp_second);
		jbtn_change.addActionListener(this);
		jbtn_exit.addActionListener(this);
		jbtn_whisper.addActionListener(this);
		jbtn_Color.addActionListener(this);
		
		 /******************************************************/
		
		// ȭ���� Ȱ��ȭ
		this.setVisible(true);
		// ȭ�� ũ�⼳��
		this.setSize(1000, 800); 
		// ���� 
		this.setTitle("����ȭ��");
		// ���̾ƿ� - BorderLayout, GridLayout(o), FlowLayout
		this.setLayout(new GridLayout(1,2));
		this.setLocation(500,100);
		this.add(jp_left);
		this.add(jp_right3);
		
		jp_right3.setLayout(new GridLayout(2,1));
		
		jp_left.setLayout(new GridLayout());
		jp_left.add(jsp_friends);
		jp_right1.setLayout(new GridLayout());
		
		jp_right3.add(jp_chatting);
		jp_right3.add(jp_right2);
		
		// jp_right2.setLayout(null);
		jbtn_msg.setBounds(30,300,100,80);
		jp_right2.add(jbtn_msg);
		jbtn_pchange.setBounds(140,300,100,80);
		jp_right2.add(jbtn_pchange);
		jbtn_in.setBounds(250, 300, 100, 80);
		jp_right2.add(jbtn_in);
		jbtn_out.setBounds(360, 300, 100, 80);
		jp_right2.add(jbtn_out);
		
		jsp_friends.setBorder(new LineBorder(Color.black, 1));
		// jsp_roomlist.setBorder(new LineBorder(Color.black, 2));

		jbtn_in.addActionListener(this);
		jbtn_out.addActionListener(this);
		jbtn_pchange.addActionListener(this);
		jbtn_msg.addActionListener(this);
		
		//-------------------------�����κ�---------------------------------
		//���� ó��
		jsp_friends.getViewport().setBackground(pink); //��ũ�� ���� ����
		jt_friends.setBackground(pink); //���̺� ����
		jt_friends.getTableHeader().setBackground(pink2); //���̺� �Ӹ� ����
		jt_friends.getTableHeader().setFont(ft_jt_friends); //���̺� �Ӹ� �۾� ����
		jt_friends.setRowHeight(30); //���̺� ���� ����
		jt_friends.setFont(ft_jt_friends2); //���̺� ������ �۾� ����
		// ����ó�� 2
		jsp_name.getViewport().setBackground(pink); //��ũ�� ���� ����
		jt_name.setBackground(pink); //���̺� ����
		jt_name.getTableHeader().setBackground(pink2); //���̺� �Ӹ� ����
		jt_name.getTableHeader().setFont(ft_jt_friends); //���̺� �Ӹ� �۾� ����
		jt_name.setRowHeight(30); //���̺� ���� ����
		jt_name.setFont(ft_jt_friends2); //���̺� ������ �۾� ����
		// ����ó��3
		// jp_right2.setBackground(pink);
		//���̺� ���� ��� ����
		dtcr.setHorizontalAlignment(SwingConstants.CENTER);
		TableColumnModel tcm = jt_friends.getColumnModel();
		for(int i = 0; i < tcm.getColumnCount(); i++)
		tcm.getColumn(i).setCellRenderer(dtcr);
		//���̺� ���� ��� ���� 2
		dtcr2.setHorizontalAlignment(SwingConstants.CENTER);
		TableColumnModel tcm2 = jt_name.getColumnModel();
		for(int i = 0; i < tcm2.getColumnCount(); i++)
		tcm2.getColumn(i).setCellRenderer(dtcr2);
		
		jbtn_pchange.setBackground(pink);
		jbtn_pchange.setFont(ft_jt_friends2);
		jbtn_change.setBackground(pink);
		jbtn_change.setFont(ft_jt_friends2);
		jbtn_Color.setBackground(pink);
		jbtn_Color.setFont(ft_jt_friends2);
		jbtn_exit.setBackground(pink);
		jbtn_exit.setFont(ft_jt_friends2);
		jbtn_in.setBackground(pink);
		jbtn_in.setFont(ft_jt_friends2);
		jbtn_msg.setBackground(pink);
		jbtn_msg.setFont(ft_jt_friends2);
		jbtn_out.setBackground(pink);
		jbtn_out.setFont(ft_jt_friends2);
		jbtn_send.setBackground(pink);
		jbtn_send.setFont(ft_jt_friends2);
		jbtn_whisper.setBackground(pink);
		jbtn_whisper.setFont(ft_jt_friends2);
		//---------------------------------------------------------------
	}
	
	@Override
	public void actionPerformed(ActionEvent ae) {
	Object obj = ae.getSource();
	String msg = jtf_msg.getText();
	int count[] = jt_friends.getSelectedRows();
	if(obj==jbtn_msg){
		if(count.length<1){
			JOptionPane.showMessageDialog(this
					,"���� ���� ����� �����ϼ���"
					,"INFO"
					,JOptionPane.INFORMATION_MESSAGE);
		}
		else if(count.length>1)
		{
			JOptionPane.showMessageDialog(this
					,"������ �ѹ��� �Ѹ��Ը� �����մϴ�."
					,"INFO"
					,JOptionPane.INFORMATION_MESSAGE);
		}
		else{
		friendsmsg();
		new ChatSend(pec,pvo);
		}
	}
	if(obj==jbtn_pchange){
		String comments = JOptionPane.showInputDialog("����� �������� �Է��ϼ���.");
		msgChange(comments);
		Friends_refreshData();
	}
	if(obj==jbtn_in){
		try {
		//	new EchoClient("192.168.0.120",7171,this.getTitle());
			new EchoClient("127.0.0.1",7171,this.getTitle());
		} catch (Exception e) {
			e.printStackTrace();
		}
		exitChat();
		this.dispose();
	}
	if(obj==jbtn_out){
		exitChat();
		this.dispose();
	}
	
	if((obj==jbtn_send) 
			|| (obj == jtf_msg)){
				try {
					pec.oos.writeObject(Protocol.TALK
							    +"#"+nickName
							    +"#"+msg
							    +"#"+fontColor);
					jtf_msg.setText("");
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			else if(obj==jbtn_change){
				String afterName = JOptionPane.showInputDialog("������ ��ȭ���� �Է����ּ��� : ");
				if(afterName==null || afterName.trim().length()<1){
									//trim(): ��������
					JOptionPane.showMessageDialog(this
										,"������ ��ȭ���� ����� �Է��ϼ���"
										,"INFO"
										,JOptionPane.INFORMATION_MESSAGE);
					return; // actionPeformd() ��������
				}
				// ������ �ϴ� �޽��� ����
				// 400#�����ȭ��#�����ȭ��
				try {
					pec.oos.writeObject(Protocol.CHANGE
							+"#"+nickName
							+"#"+afterName);
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			else if(obj==jbtn_exit){
				exitChat();
				this.jtf_msg.setText("��ȭ�� ����Ǿ����ϴ�.");
				this.jbtn_send.setEnabled(false);
				this.jtf_msg.setEditable(false);
			}
			else if(obj == jbtn_whisper){
		     	   int row = jt_name.getSelectedRow();
		     	   String name = (String)dtm_name.getValueAt(row,0);
		     	   if(row==-1){
		     		   JOptionPane.showMessageDialog(this, "�ӼӸ� ��븦 �����ϼ���", "INFO", JOptionPane.INFORMATION_MESSAGE);
		     		   return;
		     	   }else{
		     		   
		     		   if(nickName.equals(name)){
		     			   JOptionPane.showMessageDialog(this, "�ڱ��ڽ��Դϴ� �ٸ���� �����ϼ���.", "INFO", JOptionPane.INFORMATION_MESSAGE);
		     			   return;
		     		   }
		     	   }
		     	   String msg2=JOptionPane.showInputDialog(name+"�Կ��� ���� �޽��� �Է�");
		     	   
		     	   try {
		     		   pec.oos.writeObject(Protocol.WHISPER+"#"+nickName+"#"+name+"#"+msg2);
		     		   
		     	   } catch (Exception e2) {
		     		   e2.printStackTrace();
		     	   }
			}//close elseif()
	
			else if(obj==jbtn_Color){
				Color newColor = JColorChooser.showDialog(null, "������ �����ϼ���.", Color.BLACK);
				fontColor=String.valueOf(newColor.getRGB());
			}
	
		}
	
private void msgChange(String comments) {
	FriendController Fctrl = new FriendController();
	FriendVO pvo = new FriendVO();
	pvo.setCommand("update");
	pvo.setMyId(id);
	pvo.setComments(comments);
	Fctrl.update(pvo);
	}
public void Friends_refreshData(){
	//���� ������ ���̺� ��ȸ�� �� ����� �ִٸ� �ϴ� ��� �����Ѵ�.
	while(dtm_friends.getRowCount()>0){
		  dtm_friends.removeRow(0);
	}
	FriendController Fctrl = new FriendController();
	FriendVO pvo = new FriendVO();
	pvo.setCommand("selectall");
	FriendVO avos[] = Fctrl.FriendSearch(pvo);
	System.out.println("Friends_refresh");
	for(int i=0;i<avos.length;i++){
		Vector oneRow=new Vector();
		oneRow.add(avos[i].getMyId());
		oneRow.add(avos[i].getGender());
		oneRow.add(avos[i].getComments());
		oneRow.add(avos[i].getAddress());
		dtm_friends.addRow(oneRow);
	}
}
	public void exitChat(){
		try {
			pec.oos.writeObject(Protocol.ROOM_OUT
				+"#"+nickName);
	} catch (Exception e2) {
		e2.printStackTrace();
	}
		
		
}	
	public void friendsmsg(){
		int sel_pointer = jt_friends.getSelectedRow();
		//���̺� �ִ� ���� �۾�ͼ� pvo�� VO�� �����ϰ� vo�� �ѱ��
		pvo.setYourId(dtm_friends.getValueAt(sel_pointer, 0).toString());
	}	
	
	public SimpleAttributeSet makeAttribute(String style) {
		SimpleAttributeSet sas = new SimpleAttributeSet();
		sas.addAttribute(StyleConstants.ColorConstants.Foreground
				       , new Color(Integer.parseInt(style)));
		return sas;
	}
	
}
