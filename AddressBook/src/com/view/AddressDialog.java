package com.view;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import javax.swing.text.*; //<- 임포트를 추가한후에

import com.controller.AddressController;
import com.vo.AddressBookVO;

public class AddressDialog extends JDialog implements ActionListener{
	// 선언부
	JLabel jl_name = new JLabel("이름");
	JLabel jl_gender = new JLabel("성별");
	JLabel jl_birth = new JLabel("생년월일");
	JLabel jl_contact = new JLabel("연락처");
	JLabel jl_email = new JLabel("이메일");
	JLabel jl_address = new JLabel("주소");
	JLabel jl_group = new JLabel("그룹");
	JLabel jl_note = new JLabel("비고");
	
	JTextField jtf_name = new JTextField(10);
	JComboBox jcb_gender = new JComboBox();
	JTextField jtf_birth1 = new JTextField(10);
	JTextField jtf_birth2 = new JTextField(10);
	JTextField jtf_birth3 = new JTextField(10);
	JTextField jtf_contact1 = new JTextField(10);
	JTextField jtf_contact2 = new JTextField(10);
	JTextField jtf_contact3 = new JTextField(10);
	JTextField jtf_email = new JTextField(10);
	JTextField jtf_address = new JTextField(10);
	JTextField jtf_group = new JTextField(10);
	JTextArea jta_note = new JTextArea(4,20);
	
	JButton jbtn_acept = new JButton("확인");
	JButton jbtn_exit = new JButton("닫기");
	
	JScrollPane jsp_note = new JScrollPane(jta_note);
	
	AddressController ac = new AddressController();
	AddressBookVO pvo = null;
	AddressBook rBook = null;
	
	AddressBookVO rvo = new AddressBookVO();
	String title=null;
	
	String font_ham="함초롬바탕";
	Font jt_font = new Font(font_ham,Font.BOLD,13);
    Font jt_font2 = new Font(font_ham,Font.BOLD,12);
    Font title_font = new Font(font_ham,Font.BOLD,50);
    Font button_font = new Font(font_ham,Font.BOLD,15);
	JOptionPane jop = new JOptionPane();
	Font jtf_font = new Font(font_ham,Font.BOLD,13);
	Color White = new Color(255,255,255);
	public void set(String title, boolean isView)
	{
		this.setTitle(title);
		this.setVisible(isView);
		this.title=title;
	}

	public void set(AddressBook aBook, String title, boolean isView) {
		this.setTitle(title);
		this.setVisible(isView);
		rBook=aBook;
		this.title=title;
	}
	
	// 생성자
	public AddressDialog(){
		initDisplay();
	}
	
	
	public AddressBookVO Detail(AddressBookVO pvo){
		if("여".equals(pvo.getAdd_gender()))
		{
			jcb_gender.setSelectedIndex(1);
		}
		else
		{
			jcb_gender.setSelectedIndex(0);
		}
		jtf_name.setText(pvo.getAdd_name());
		jtf_birth1.setText(pvo.getAdd_birth().substring(0,2));
		jtf_birth2.setText(pvo.getAdd_birth().substring(3,5));
		jtf_birth3.setText(pvo.getAdd_birth().substring(6,8));
		jtf_contact1.setText(pvo.getAdd_contact().substring(0,3));
		jtf_contact2.setText(pvo.getAdd_contact().substring(4,8));
		jtf_contact3.setText(pvo.getAdd_contact().substring(9,13));
		
		if(pvo.getAdd_email().equals("")){pvo.setAdd_email(" ");}
		if(pvo.getAdd_address().equals("")){pvo.setAdd_address(" ");}
		if(pvo.getAdd_group().equals("")){pvo.setAdd_group(" ");}
		if(pvo.getAdd_note().equals("")){pvo.setAdd_note(" ");}
		
		jtf_email.setText(pvo.getAdd_email());
		jtf_address.setText(pvo.getAdd_address());
		jtf_group.setText(pvo.getAdd_group());
		jta_note.setText(pvo.getAdd_note());
		
		System.out.println(this.getTitle());
		if(this.getTitle().equals("상세조회")){
			jtf_name.setEditable(false);
			jtf_birth1.setEditable(false);
			jtf_birth2.setEditable(false);
			jtf_birth3.setEditable(false);
			jtf_contact1.setEditable(false);
			jtf_contact2.setEditable(false);
			jtf_contact3.setEditable(false);
			jtf_email.setEditable(false);
			jtf_address.setEditable(false);
			jtf_group.setEditable(false);
			jta_note.setEditable(false);
			jcb_gender.setEditable(false);
		}
		else{
			jtf_name.setEditable(true);
			jtf_birth1.setEditable(true);
			jtf_birth2.setEditable(true);
			jtf_birth3.setEditable(true);
			jtf_contact1.setEditable(true);
			jtf_contact2.setEditable(true);
			jtf_contact3.setEditable(true);
			jtf_email.setEditable(true);
			jtf_address.setEditable(true);
			jtf_group.setEditable(true);
			jta_note.setEditable(true);
			jcb_gender.setEditable(true);
		}
		
		rvo=pvo;
		
		return null;
	}
	// 화면처리부
	public void initDisplay(){
		this.setLayout(null);
		
		jl_name.setBounds(20, 20, 100, 20); this.add(jl_name);
		jl_gender.setBounds(20, 40, 100, 40); this.add(jl_gender);
		jl_birth.setBounds(20, 60, 100, 60); this.add(jl_birth);
		jl_contact.setBounds(20, 80, 100, 80); this.add(jl_contact);
		jl_email.setBounds(20, 100, 100, 100); this.add(jl_email);
		jl_address.setBounds(20, 120, 100, 120); this.add(jl_address);
		jl_group.setBounds(20, 140, 100, 140); this.add(jl_group);
		jl_note.setBounds(20, 160, 100, 160); this.add(jl_note);
		
		jtf_name.setBounds(120, 20, 150, 20); this.add(jtf_name);
		jcb_gender.setBounds(120, 50, 150, 20); this.add(jcb_gender);
		jtf_birth1.setBounds(120, 80, 40, 20); this.add(jtf_birth1);
		jtf_birth2.setBounds(170, 80, 40, 20); this.add(jtf_birth2);
		jtf_birth3.setBounds(220, 80, 40, 20); this.add(jtf_birth3);
		jtf_contact1.setBounds(120, 110, 40, 20); this.add(jtf_contact1);
		jtf_contact2.setBounds(170, 110, 40, 20); this.add(jtf_contact2);
		jtf_contact3.setBounds(220, 110, 40, 20); this.add(jtf_contact3);
		jtf_email.setBounds(120, 140, 150, 20); this.add(jtf_email);
		jtf_address.setBounds(120, 170, 150, 20); this.add(jtf_address);
		jtf_group.setBounds(120, 200, 150, 20); this.add(jtf_group);
		jsp_note.setBounds(120, 230, 150, 50); this.add(jsp_note);
		
		jcb_gender.addItem("남"); 
		jcb_gender.addItem("여");
		
		jbtn_acept.setBounds(20, 300, 110, 20); this.add(jbtn_acept);
		jbtn_exit.setBounds(160, 300, 110, 20); this.add(jbtn_exit);
		this.getContentPane().setBackground(Color.black);

		this.setSize(300, 400);
		this.setVisible(false);
		
		jbtn_acept.addActionListener(this);
		jbtn_exit.addActionListener(this);
		

		//===============
	      // 폰트 바꾸기
	      //===============
	      // 입력,수정,상세조회 배경색 변경
	      this.setBackground(Color.BLACK);
	      
	      //입력,수정,상세조회 창 폰트색 변경
	      jl_name.setForeground(White);
	      jl_gender.setForeground(White);
	      jl_birth.setForeground(White);
	      jl_contact.setForeground(White);
	      jl_email.setForeground(White);
	      jl_address.setForeground(White);
	      jl_group.setForeground(White);
	      jl_note.setForeground(White);
	      
	      //입력,수정,상세조회 창 폰트 변경
	      jl_name.setFont(jt_font);
	      jl_gender.setFont(jt_font);
	      jl_birth.setFont(jt_font);
	      jl_contact.setFont(jt_font);
	      jl_email.setFont(jt_font);
	      jl_address.setFont(jt_font);
	      jl_group.setFont(jt_font);
	      jl_note.setFont(jt_font);
	      
	      //확인, 닫기 버튼 배경색, 폰트
	      jbtn_acept.setBackground(Color.YELLOW);
	      jbtn_exit.setBackground(Color.YELLOW);
	      jbtn_acept.setFont(jt_font2);
	      jbtn_exit.setFont(jt_font2);
	      
	      //성별 폰트 변경
	      jcb_gender.setFont(jt_font2);
		
		jtf_name.setFont(jtf_font);
		jtf_birth1.setFont(jtf_font);
		jtf_birth2.setFont(jtf_font);
		jtf_birth3.setFont(jtf_font);
		jtf_contact1.setFont(jtf_font);
		jtf_contact2.setFont(jtf_font);
		jtf_contact3.setFont(jtf_font);
		jtf_email.setFont(jtf_font);
		jtf_address.setFont(jtf_font);
		jtf_group.setFont(jtf_font);
		jta_note.setFont(jtf_font);
		jcb_gender.setFont(jtf_font);
		
		jtf_name.setDocument(new textlimit(10)); 
		jtf_birth1.setDocument(new textlimit(2)); 
		jtf_birth2.setDocument(new textlimit(2)); 
		jtf_birth3.setDocument(new textlimit(2)); 
		jtf_contact1.setDocument(new textlimit(3)); 
		jtf_contact2.setDocument(new textlimit(4)); 
		jtf_contact3.setDocument(new textlimit(4));

}


	@Override
	public void actionPerformed(ActionEvent ae) {
		Object obj = ae.getSource();
		// 확인
		pvo=new AddressBookVO();
		pvo.setAdd_name(jtf_name.getText());
		pvo.setAdd_gender(jcb_gender.getSelectedItem().toString());
		pvo.setAdd_birth(jtf_birth1.getText()+"."+jtf_birth2.getText()+"."+jtf_birth3.getText());
		pvo.setAdd_contact(jtf_contact1.getText()+"-"+jtf_contact2.getText()+"-"+jtf_contact3.getText());
		pvo.setAdd_email(jtf_email.getText());
		pvo.setAdd_address(jtf_address.getText());
		pvo.setAdd_group(jtf_group.getText());
		pvo.setAdd_note(jta_note.getText());
		pvo.setSeq_no(rvo.getSeq_no());
		
		if(jtf_name.getText().equals("")){pvo.setAdd_name(" ");}
		if(jtf_email.getText().equals("")){pvo.setAdd_email(" ");}
		if(jtf_address.getText().equals("")){pvo.setAdd_address(" ");}
		if(jtf_group.getText().equals("")){pvo.setAdd_group("그룹미지정");}
		if(jta_note.getText().equals("")){pvo.setAdd_note(" ");}
		
		if(obj==jbtn_acept){
			if(jtf_name.getText().equals("") 
			|| jtf_contact1.getText().equals("")
			|| jtf_contact2.getText().equals("") 
			|| jtf_contact3.getText().equals(""))
					{
						jop.showMessageDialog(this 
								,"이름, 번호는 필수입니다.\n"+ "다시입력하세요"
								,"경고"
								,JOptionPane.ERROR_MESSAGE);
						return;
					}
			
			if("수정".equals(this.getTitle())){
				pvo.setCommand("update");
				ac.send(pvo);
				this.dispose();
				jtf_name.setText("");
				jcb_gender.setSelectedItem("남");
				jtf_birth1.setText("");
				jtf_birth2.setText("");
				jtf_birth3.setText("");
				jtf_contact1.setText("");
				jtf_contact2.setText("");
				jtf_contact3.setText("");
				jtf_email.setText("");
				jtf_address.setText("");
				jtf_group.setText("");
				jta_note.setText("");
				rBook.refreshData();
			}
			
			if("입력".equals(this.getTitle())){
				pvo.setCommand("insert");
				ac.send(pvo);
				this.dispose();
				jtf_name.setText("");
				jcb_gender.setSelectedItem("남");
				jtf_birth1.setText("");
				jtf_birth2.setText("");
				jtf_birth3.setText("");
				jtf_contact1.setText("");
				jtf_contact2.setText("");
				jtf_contact3.setText("");
				jtf_email.setText("");
				jtf_address.setText("");
				jtf_group.setText("");
				jta_note.setText("");
				rBook.refreshData();
			}
			
			if("상세조회".equals(this.getTitle())){
				jtf_name.setText("");
				jcb_gender.setSelectedItem("남");
				jtf_birth1.setText("");
				jtf_birth2.setText("");
				jtf_birth3.setText("");
				jtf_contact1.setText("");
				jtf_contact2.setText("");
				jtf_contact3.setText("");
				jtf_email.setText("");
				jtf_address.setText("");
				jtf_group.setText("");
				jta_note.setText("");
				rBook.refreshData();
				this.dispose();
				
				jtf_name.setEditable(true);
				jtf_birth1.setEditable(true);
				jtf_birth2.setEditable(true);
				jtf_birth3.setEditable(true);
				jtf_contact1.setEditable(true);
				jtf_contact2.setEditable(true);
				jtf_contact3.setEditable(true);
				jtf_email.setEditable(true);
				jtf_address.setEditable(true);
				jtf_group.setEditable(true);
				jta_note.setEditable(true);
				jcb_gender.setEditable(true);
			}
			
		
		}
			
		else if(obj==jbtn_exit){
			jtf_name.setText("");
			jcb_gender.setSelectedItem("남");
			jtf_birth1.setText("");
			jtf_birth2.setText("");
			jtf_birth3.setText("");
			jtf_contact1.setText("");
			jtf_contact2.setText("");
			jtf_contact3.setText("");
			jtf_email.setText("");
			jtf_address.setText("");
			jtf_group.setText("");
			jta_note.setText("");
			
			jtf_name.setEditable(true);
			jtf_birth1.setEditable(true);
			jtf_birth2.setEditable(true);
			jtf_birth3.setEditable(true);
			jtf_contact1.setEditable(true);
			jtf_contact2.setEditable(true);
			jtf_contact3.setEditable(true);
			jtf_email.setEditable(true);
			jtf_address.setEditable(true);
			jtf_group.setEditable(true);
			jta_note.setEditable(true);
			jcb_gender.setEditable(true);
			
			this.dispose();
			return;
		}		
	}

	//아래의 함수를 추가하면 입력 수 제한을 할수 있다.
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