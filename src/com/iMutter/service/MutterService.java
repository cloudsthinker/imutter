package com.iMutter.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.iMutter.dao.MutterDao;
import com.iMutter.vo.MutterVO;

@Component
public class MutterService {
	
	private MutterDao mutterDao;
	
	/**
	 * ������������Ϣ����
	 * @param mutterString �����Ϣ�ַ���
	 * @return 1����ӳɹ���0�����ʧ��
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
