package com.util;

public class KoreanConversion {
	public static String toKor(String en){
		if(en == null) return null;
		try {
			return new String(en.getBytes("8859_1"),"euc-kr");
		} catch (Exception e) {
			return en;
		}
	}
}
