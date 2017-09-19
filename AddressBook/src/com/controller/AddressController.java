package com.controller;

import java.util.Vector;

import com.model.AddLogic;
import com.model.DelLogic;
import com.model.ModLogic;
import com.model.SearchLogic;
import com.vo.AddressBookVO;

public class AddressController{
	private static final String _ADD = "insert";
	private static final String _MOD = "update";
	private static final String _DEL = "delete";
	private static final String _ALL = "select";
	private static final String _DET = "detail";
	
	public AddressBookVO send(AddressBookVO pvo){
		AddressBookVO rvo = new AddressBookVO();
		// �Է�?
		if(_ADD.equals(pvo.getCommand())){
			AddLogic addLogic = new AddLogic();
			rvo=addLogic.insertAddress(pvo);
	    }
		// ����?
		else if(_MOD.equals(pvo.getCommand())){
			ModLogic modLogic = new ModLogic();
			rvo=modLogic.updateAddress(pvo);
	    }
		// ����?
		else if(_DEL.equals(pvo.getCommand())){
			DelLogic delLogic = new DelLogic();
			rvo=delLogic.deleteAddress(pvo);
	    }
		// �˻�?
		else if(_ALL.equals(pvo.getCommand())){
			SearchLogic serLogic = new SearchLogic();
			rvo=serLogic.selectAddress(pvo);
	    }
		
		return rvo;
	}

}
