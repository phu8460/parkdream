package kos.util;

import java.util.HashMap;
import java.util.Iterator;

public class PageBar {
	private int totalRecord;       //��ü ���ڵ� ����
	private int numPerPage;   //�������� default �ۼ�
	private int pagePerBlock=2; //��ϴ� default ��������
	private int totalPage;         //����������
	private int totalBlock;        //�Ѻ�ϼ�
	private int nowPage;           //����������
	private int nowBlock;          //���� ��

	private String pagePath;       //����Ʈ������ ���
	private String tblBar;         //��������
	
	//������ �׺���̼� �ʱ�ȭ
	public PageBar(){}
	public PageBar(int numPerPage, int totalRecord, int nowPage, String pagePath){
		this.numPerPage = numPerPage;
		this.totalRecord = totalRecord;
		this.nowPage = nowPage;
		this.pagePath = pagePath;
		this.totalPage = (int)Math.ceil((double)this.totalRecord/this.numPerPage);
		this.totalBlock = (int)Math.ceil((double)this.totalPage/this.pagePerBlock);
		this.nowBlock =(int)((double)this.nowPage/this.pagePerBlock);
	}
	 
	//������ �׺���̼� ����
	public void setPageBar(){
		StringBuffer pageLink = new StringBuffer();
		if(totalRecord > 0){
			if(nowBlock > 0){
				pageLink.append("<a href='"+pagePath+"?page="+((nowBlock-1)*pagePerBlock+(pagePerBlock-1))+"'>");			
				pageLink.append("<img border=2 src='../images/b_prev.jpg'>");
				pageLink.append("</a>&nbsp;&nbsp;");
			}
			for(int i=0;i<pagePerBlock;i++){
				//���� ���� �����ִ� ������ ����̴�.
				if(nowBlock*pagePerBlock+i == nowPage){
					pageLink.append("<b>"+(nowBlock*pagePerBlock+i+1)+"</b>&nbsp;&nbsp;&nbsp;");
				}else{
					pageLink.append("<a href='"+pagePath+"?page="+((nowBlock*pagePerBlock)+i)
							+"'>"+((nowBlock*pagePerBlock)+i+1)+"</a>&nbsp;&nbsp;&nbsp;");					
				}
				if((nowBlock*pagePerBlock)+i+1 == totalPage) break;
			}
			//���� ��Ͽ��� ���� ����� ������ ��� �̹��� �߰��ϰ� ������ �̵��� �� �ֵ��� ��ũ
			if(totalBlock > nowBlock+1){
				pageLink.append("&nbsp;&nbsp;<a href='"+pagePath+"?page="
				+((nowBlock+1)*pagePerBlock)+"'>");
				pageLink.append("<img border=0 src='../images/next.jpg'>");
				pageLink.append("</a>");
			}
		}// if ended
		tblBar = pageLink.toString();
	}//setPageBar() ended
	//�������׺���̼� ����
	public String getPageBar(){
		this.setPageBar();
		return tblBar;
	}
}








