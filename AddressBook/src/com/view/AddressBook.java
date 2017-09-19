package com.view;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.Border;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import com.controller.AddressController;
import com.vo.AddressBookVO;

public class AddressBook extends JFrame implements ActionListener,KeyListener,FocusListener{
	public static AddressBook aBook = null;
	JFrame jf_address = new JFrame("�ּҷ�");
	
	JPanel jp_north = new JPanel(); 
	JPanel jp_title = new JPanel(); 
	JPanel jp_search = new JPanel(); 
	JLabel jlb_group = new JLabel("�׷�");
	JLabel title = new JLabel("�ּҷ�");
	JTextField 	jtf_input	= new JTextField(10);
	JButton jbtn_insert = new JButton("�Է�");
	JButton jbtn_update = new JButton("����");
	JButton jbtn_delete = new JButton("����");
	JButton jbtn_detail = new JButton("����ȸ");
	JButton jbtn_exit = new JButton("����");
	JButton jbtn_search = new JButton("�˻�");
	JComboBox combo_group=new JComboBox();
	JPanel jp_buttons = new JPanel(); 
	String cols[]={"�̸�","����","�������","����ó","�̸���"
			,"�ּ�","�׷�","���","����"};
	String data[][] = new String[0][cols.length];
	JTextArea jta_result = new JTextArea();
	
	DefaultTableModel dtm_address = new DefaultTableModel(data,cols);
	JTable jt_address = new JTable(dtm_address);
	JScrollPane jsp_add = new JScrollPane(jt_address);
	
	AddressDialog aDialog = new AddressDialog();
	boolean isView = true;
	
	AddressBookVO pvo = new AddressBookVO();
	AddressController ac = new AddressController();
	
	JOptionPane jop = new JOptionPane();
	
    boolean focusYn = false;
    String empty = "������";
    
    String font_name = "MD�̼�ü";
    String font_ham = "���ʷҵ���";
    
    Color Black = new Color(0,0,0);
    Color White = new Color(255,255,255);
    Color Yellow = Color.YELLOW;
    Color Red = new Color(255,0,0);
    Color Blue = new Color(0,0,255);
    Color Green = new Color(0,128,0);
    Font jt_font = new Font(font_ham,Font.BOLD,13);
    Font title_font = new Font(font_name,Font.BOLD,50);
    Font button_font = new Font(font_name,Font.BOLD,15);

	   // (Į���, ���⸦ �����ϱ���)       
    Border border = new javax.swing.border.LineBorder(Color.orange, 10);
    // ���̺� ����� �����, ��׶����, border �� �����մϴ�.
    JTableHeader jt_head = new JTableHeader();
    
	// ������
	public AddressBook(){}
	
	public void initDisplay(){
		this.setVisible(true);
		this.setSize(800,500);
		this.setTitle("�ּҷ�");
		this.setLayout(new BorderLayout(4,1));
		this.add("North",jp_north);
		this.add("Center",jp_search);
		this.add("South",jp_buttons);
		this.add(jsp_add);
		
	      /** 
	       * color font zone
	       */
	      title.setFont(title_font);
	      title.setForeground(White);
	      
	      jp_title.setBackground(Black);
	      jp_search.setBackground(Black);
	      jp_buttons.setBackground(Black);
	      jsp_add.setBackground(Black);
	      jt_address.setBackground(Black);
	      jt_address.setForeground(White);
	      
	      jbtn_search.setBackground(Yellow);
	      jbtn_insert.setBackground(Yellow);
	      jbtn_update.setBackground(Yellow);
	      jbtn_delete.setBackground(Yellow);
	      jbtn_detail.setBackground(Yellow);
	      jbtn_exit.setBackground(Yellow);
	      combo_group.setBackground(Yellow);
	       
	      jt_address.setFont(jt_font);
	      jbtn_search.setFont(button_font);
	      combo_group.setFont(button_font);
	      jbtn_insert.setFont(button_font);
	      jbtn_update.setFont(button_font);
	      jbtn_delete.setFont(button_font);
	      jbtn_detail.setFont(button_font);
	      jbtn_exit.setFont(button_font);
	      
	      jsp_add.getViewport().setBackground(Color.BLACK);
	      	
	      jt_address.getTableHeader().setBackground(Yellow);
	      jt_address.getTableHeader().setFont(jt_font);
	      
	      /** 
	       * color font zone
	       */
		
		jp_title.setLayout(new FlowLayout());
		jp_title.add(title);
		
		jp_search.setLayout(new FlowLayout());
		jp_search.add(combo_group);
		jp_search.add(jtf_input);
		jp_search.add(jbtn_search);
		
		jp_buttons.setLayout(new FlowLayout());
		jp_buttons.add(jbtn_insert);
		jp_buttons.add(jbtn_update);
		jp_buttons.add(jbtn_delete);
		jp_buttons.add(jbtn_detail);
		jp_buttons.add(jbtn_exit);
		
		jp_north.setLayout(new GridLayout(2,1));
		jp_north.add(jp_title);
		jp_north.add(jp_search);
		
		// �޺��ڽ��� �׸��߰�.
		combo_group.addItem("�̸�"); 
		combo_group.addItem("����");
		combo_group.addItem("�������");
		combo_group.addItem("����ó");
		combo_group.addItem("�̸���");
		combo_group.addItem("�ּ�");
		combo_group.addItem("�׷�");
		combo_group.addItem("���");
		
		// ������ JTable���� ����ºκ�
		jt_address.getColumn("����").setWidth(0);
		jt_address.getColumn("����").setMinWidth(0);
		jt_address.getColumn("����").setMaxWidth(0);

		// �̺�Ʈ ó����
		jbtn_insert.addActionListener(this);
		jbtn_update.addActionListener(this);
		jbtn_delete.addActionListener(this);
		jbtn_detail.addActionListener(this);
		jbtn_exit.addActionListener(this); 
		jbtn_search.addActionListener(this);
		jtf_input.addKeyListener(this);
		jtf_input.addFocusListener(this);
	}
	
	public static void main(String[] agrs){
		aBook.setDefaultLookAndFeelDecorated(true);
		// �����
		aBook = new AddressBook();
		aBook.initDisplay();
		
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		Object obj = ae.getSource();
		
		int select_num = jt_address.getSelectedRow();
		
		// �Է� ��ư?
		if(obj==jbtn_insert){
			aDialog.set(aBook,jbtn_insert.getText(), isView);
		}
		// ������ư?
		else if(obj==jbtn_update){
			if(select_num==-1)
			{
				jop.showMessageDialog(this 
						,"���� �� ���� �����ϼ���."
						,"���"
						,JOptionPane.ERROR_MESSAGE);
				return;
			}
			
			aDialog.set(aBook, jbtn_update.getText(), isView);
			dialogView();
			aDialog.Detail(pvo);
			
		}
		// ������ư?
		else if(obj==jbtn_delete){
			if(select_num==-1)
					{
						jop.showMessageDialog(this 
								,"���� �� ���� �����ϼ���."
								,"���"
								,JOptionPane.ERROR_MESSAGE);
						return;
					}
			int sel_pointer = jt_address.getSelectedRow();
			
			pvo.setSeq_no(Integer.parseInt(dtm_address.getValueAt(sel_pointer, 8).toString()));
			pvo.setCommand("delete");
			ac.send(pvo);
			refreshData();
		}
		// �˻� ��ư?
		else if(obj==jbtn_search){
			if(dtm_address.getRowCount() !=0){
				dtm_address.setRowCount(0);
			}
			
			if(("").equals(jtf_input.getText()))
			{}
			else{
				pvo.setWhere(jtf_input.getText());
				pvo.setCombo(combo_group.getSelectedIndex());
			}

			pvo.setCommand("select");
			pvo=ac.send(pvo); 
			
			AddressBookVO dvos[]=pvo.getSelect();
	         
			for(int i=0; i<dvos.length; i++)
			{
				Vector oneRow=new Vector();
				oneRow.add(dvos[i].getAdd_name());
				oneRow.add(dvos[i].getAdd_gender());
				oneRow.add(dvos[i].getAdd_birth());
				oneRow.add(dvos[i].getAdd_contact());
				oneRow.add(dvos[i].getAdd_email());
				oneRow.add(dvos[i].getAdd_address());
				oneRow.add(dvos[i].getAdd_group());
				oneRow.add(dvos[i].getAdd_note());
				oneRow.add(dvos[i].getSeq_no());
				dtm_address.addRow(oneRow);
			}

		}	
		else if(obj==jbtn_detail) // ����ȸ
		{
			if(select_num==-1)
			{
				jop.showMessageDialog(this 
						,"����ȸ �� ���� �����ϼ���."
						,"���"
						,JOptionPane.ERROR_MESSAGE);
				return;
			}
			
			aDialog.set(aBook,jbtn_detail.getText(), isView);
			dialogView();
			aDialog.Detail(pvo);
		}
		else if(obj==jbtn_exit)
		{
			System.exit(0);
		}
	}

	@Override
	public void focusGained(FocusEvent arg0) {
		  focusYn = true; //��Ŀ���� �ؽ�Ʈ������ ������
	}

	@Override
	public void focusLost(FocusEvent arg0) {
		  focusYn = false; //��Ŀ���� �ؽ�Ʈ������ ������
	}

	@Override
	public void keyPressed(KeyEvent e) {
		  if(focusYn==true){
			   if(e.getKeyCode() == KeyEvent.VK_ENTER){ //����Ű�� ����������
				   jbtn_search.doClick(); 
			   }
		  }
	}

	public void refreshData(){
		if(dtm_address.getRowCount() !=0){
			dtm_address.setRowCount(0);
		}
		
		if(("").equals(jtf_input.getText()))
		{}
		else{
			pvo.setWhere(jtf_input.getText());
			pvo.setCombo(combo_group.getSelectedIndex());
		}

		pvo.setCommand("select");
		pvo=ac.send(pvo); 
		
		AddressBookVO dvos[]=pvo.getSelect();
         
		for(int i=0; i<dvos.length; i++)
		{
			Vector oneRow=new Vector();
			oneRow.add(dvos[i].getAdd_name());
			oneRow.add(dvos[i].getAdd_gender());
			oneRow.add(dvos[i].getAdd_birth());
			oneRow.add(dvos[i].getAdd_contact());
			oneRow.add(dvos[i].getAdd_email());
			oneRow.add(dvos[i].getAdd_address());
			oneRow.add(dvos[i].getAdd_group());
			oneRow.add(dvos[i].getAdd_note());
			oneRow.add(dvos[i].getSeq_no());
			dtm_address.addRow(oneRow);
		}
	}
	
	public void dialogView(){

		int sel_pointer= jt_address.getSelectedRow();
		
		// ���̺� �ִ� �� �ܾ�ͼ� pvo�� VO�� �����ϰ� vo�� �ѱ�
		pvo.setAdd_name(dtm_address.getValueAt(sel_pointer, 0).toString());
		pvo.setAdd_gender(dtm_address.getValueAt(sel_pointer, 1).toString());
		pvo.setAdd_birth(dtm_address.getValueAt(sel_pointer, 2).toString());
		pvo.setAdd_contact(dtm_address.getValueAt(sel_pointer, 3).toString());
		pvo.setAdd_email(dtm_address.getValueAt(sel_pointer, 4).toString());
		pvo.setAdd_address(dtm_address.getValueAt(sel_pointer, 5).toString());
		pvo.setAdd_group(dtm_address.getValueAt(sel_pointer, 6).toString());
		pvo.setAdd_note(dtm_address.getValueAt(sel_pointer, 7).toString());
		pvo.setSeq_no(Integer.parseInt(dtm_address.getValueAt(sel_pointer, 8).toString()));
		
		pvo.setCommand("update");
	}
	@Override
	public void keyReleased(KeyEvent e){}
	@Override
	public void keyTyped(KeyEvent e) {}
}
