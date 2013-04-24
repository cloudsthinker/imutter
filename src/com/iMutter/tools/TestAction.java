package com.iMutter.tools;

import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport{

	private Test test;
	
	@Override
	public String execute(){
		System.out.println("i'm here!");   
		test.testDB();
		return SUCCESS;
    }
	
	public void setTest(Test test) {
		this.test = test;
	}

}
