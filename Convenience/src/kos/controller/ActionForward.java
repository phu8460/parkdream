package kos.controller;

public class ActionForward {
	
	// false:forward, true:sendRedirect
	private boolean isRedirect = false;
	private String path; //url정보를 담을 변수
	
	public void setPath(String path){
		this.path=path;
	}
	public String getPath(){
		return path;
	}
	public boolean getRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
