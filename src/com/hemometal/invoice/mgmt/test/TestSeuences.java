package com.hemometal.invoice.mgmt.test;

import com.hemometal.invoice.mgmt.helper.SequenceHelper;

public class TestSeuences {
	
	public static void main(String[] args) {
		
		
		SequenceHelper sh = new SequenceHelper();
		System.out.println(sh.CLI_SEQ + " " +sh.getNext(SequenceHelper.CLI_SEQ));
		System.out.println(sh.ITEM_SEQ + " " +sh.getNext(SequenceHelper.ITEM_SEQ));
		System.out.println(sh.PRO_SEQ + " " +sh.getNext(SequenceHelper.PRO_SEQ));
		
	}

}
