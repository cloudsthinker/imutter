package com.iMutter.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.iMutter.dao.MutterDao;
import com.iMutter.vo.MutterVO;

@Component
public class MutterService {
	
	private MutterDao mutterDao;
	
	/**
	 * 添加匿名嘟囔信息方法
	 * @param mutterString 嘟囔信息字符串
	 * @return 1：添加成功；0：添加失败
	 */
	public String addAnonymousMutter(String mutterString){
		return mutterDao.addAnonymousMutter(mutterString);
	}
	
	public List<MutterVO> fetchMutterList(int pageNo){
		return mutterDao.fetchMutterList(pageNo);
	}
	
	public int fetchMutterListPageSize(){
		return mutterDao.fetchMutterListPageSize();
	}
	
	public void setMutterDao(MutterDao mutterDao){
		
		this.mutterDao = mutterDao;
	}
}
