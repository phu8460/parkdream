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
	JFrame jf_address = new JFrame("주소록");
	
	JPanel jp_north = new JPanel(); 
	JPanel jp_title = new JPanel(); 
	JPanel jp_search = new JPanel(); 
	JLabel jlb_group = new JLabel("그룹");
	JLabel title = new JLabel("주소록");
	JTextField 	jtf_input	= new JTextField(10);
	JButton jbtn_insert = new JButton("입력");
	JButton jbtn_update = new JButton("수정");
	JButton jbtn_delete = new JButton("삭제");
	JButton jbtn_detail = new JButton("상세조회");
	JButton jbtn_exit = new JButton("종료");
	JButton jbtn_search = new JButton("검색");
	JComboBox combo_group=new JComboBox();
	JPanel jp_buttons = new JPanel(); 
	String cols[]={"이름","성별","생년월일","연락처","이메일"
			,"주소","그룹","비고","순번"};
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
    String empty = "미지정";
    
    String font_name = "MD이솝체";
    String font_ham = "함초롬돋움";
    
    Color Black = new Color(0,0,0);
    Color White = new Color(255,255,255);
    Color Yellow = Color.YELLOW;
    Color Red = new Color(255,0,0);
    Color Blue = new Color(0,0,255);
    Color Green = new Color(0,128,0);
    Font jt_font = new Font(font_ham,Font.BOLD,13);
    Font title_font = new Font(font_name,Font.BOLD,50);
    Font button_font = new Font(font_name,Font.BOLD,15);

	   // (칼라와, 굵기를 지정하구요)       
    Border border = new javax.swing.border.LineBorder(Color.orange, 10);
    // 테이블 헤더를 만들고, 백그라운드와, border 를 설정합니다.
    JTableHeader jt_head = new JTableHeader();
    
	// 생성자
	public AddressBook(){}
	
	public void initDisplay(){
		this.setVisible(true);
		this.setSize(800,500);
		this.setTitle("주소록");
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
		
		// 콤보박스에 항목추가.
		combo_group.addItem("이름"); 
		combo_group.addItem("성별");
		combo_group.addItem("생년월일");
		combo_group.addItem("연락처");
		combo_group.addItem("이메일");
		combo_group.addItem("주소");
		combo_group.addItem("그룹");
		combo_group.addItem("비고");
		
		// 순번을 JTable에서 숨기는부분
		jt_address.getColumn("순번").setWidth(0);
		jt_address.getColumn("순번").setMinWidth(0);
		jt_address.getColumn("순번").setMaxWidth(0);

		// 이벤트 처리부
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
		// 선언부
		aBook = new AddressBook();
		aBook.initDisplay();
		
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		Object obj = ae.getSource();
		
		int select_num = jt_address.getSelectedRow();
		
		// 입력 버튼?
		if(obj==jbtn_insert){
			aDialog.set(aBook,jbtn_insert.getText(), isView);
		}
		// 수정버튼?
		else if(obj==jbtn_update){
			if(select_num==-1)
			{
				jop.showMessageDialog(this 
						,"수정 할 행을 선택하세요."
						,"경고"
						,JOptionPane.ERROR_MESSAGE);
				return;
			}
			
			aDialog.set(aBook, jbtn_update.getText(), isView);
			dialogView();
			aDialog.Detail(pvo);
			
		}
		// 삭제버튼?
		else if(obj==jbtn_delete){
			if(select_num==-1)
					{
						jop.showMessageDialog(this 
								,"삭제 할 행을 선택하세요."
								,"경고"
								,JOptionPane.ERROR_MESSAGE);
						return;
					}
			int sel_pointer = jt_address.getSelectedRow();
			
			pvo.setSeq_no(Integer.parseInt(dtm_address.getValueAt(sel_pointer, 8).toString()));
			pvo.setCommand("delete");
			ac.send(pvo);
			refreshData();
		}
		// 검색 버튼?
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
		else if(obj==jbtn_detail) // 상세조회
		{
			if(select_num==-1)
			{
				jop.showMessageDialog(this 
						,"상세조회 할 행을 선택하세요."
						,"경고"
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
		  focusYn = true; //포커스가 텍스트안으로 들어왔음
	}

	@Override
	public void focusLost(FocusEvent arg0) {
		  focusYn = false; //포커스가 텍스트안으로 들어왔음
	}

	@Override
	public void keyPressed(KeyEvent e) {
		  if(focusYn==true){
			   if(e.getKeyCode() == KeyEvent.VK_ENTER){ //엔터키가 눌러졌으면
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
		
		// 테이블에 있는 값 긁어와서 pvo로 VO에 저장하고 vo를 넘김
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
