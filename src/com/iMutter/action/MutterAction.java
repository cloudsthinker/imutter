package com.iMutter.action;


import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.iMutter.service.MutterService;
import com.iMutter.vo.MutterVO;

public class MutterAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MutterService mutterService;
	private String operationState;
	private String mutterString;
	private String pageNo;
	private int pageSize;
	private List<MutterVO> mutterList;
	

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public List<MutterVO> getMutterList() {
		return mutterList;
	}

	public void setMutterList(List<MutterVO> mutterList) {
		this.mutterList = mutterList;
	}

	public String getMutterString() {
		return mutterString;
	}

	public void setMutterString(String mutterString) {
		this.mutterString = mutterString;
	}

	public String getOperationState() {
		return operationState;
	}

	public void setOperationState(String operationState) {
		this.operationState = operationState;
	}

	@Override
	public String execute(){
		System.out.println("i'm here!");   
		//test.testDB();
		return SUCCESS;
    }
	
	/*
	 * 获取嘟囔列表信息
	 */
	public String queryMutterList(){
		
		return SUCCESS;
	}
	
	
	public String addAnonymousMutter(){
		//一种获取url参数的方法
		System.out.println("param is:" + mutterString);
		
		operationState = mutterService.addAnonymousMutter(mutterString);

		return SUCCESS;
		
	}
	
	public String fetchMutterList(){

		System.out.println("parma is:" + pageNo);
		
		int pageIndex = 0;
		
		pageSize = mutterService.fetchMutterListPageSize();
		
		//为了使主页url更整洁
		if(pageNo == null){
			return SUCCESS;
		}else{
			pageIndex = Integer.parseInt(pageNo);
		}
		
		mutterList = mutterService.fetchMutterList(pageIndex);
		
		return SUCCESS;
		
	}
	
	
	public void setMutterService(MutterService mutterService){
		
		this.mutterService = mutterService;
	}
}
