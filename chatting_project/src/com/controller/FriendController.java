package com.controller;

import com.model.FriendModLogic;
import com.model.FriendSearchLogic;
import com.vo.FriendVO;

public class FriendController {
	private static final String _ADD = "insert";
	private static final String _MOD = "update";
	private static final String _FSEL= "selectall";
	
	public void update(FriendVO pvo) {
			FriendModLogic mod 	= new FriendModLogic();
			mod.insertFriend(pvo);
	}
	
	public FriendVO[] FriendSearch(FriendVO pvo){
		System.out.println("ä�ù� ��ȸ ����");
		FriendVO avos[] = null;
		if(_FSEL.equals(pvo.getCommand())){
			System.out.println("_FSEL����");
		FriendSearchLogic Fserchlogic = new FriendSearchLogic();
			avos = Fserchlogic.FriendSerach(pvo);
		}
		return avos;
	}
}
