package com.iMutter.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

import com.iMutter.vo.MutterVO;


@Component
public class MutterDao extends JdbcDaoSupport{
	
	/**
	 * ������������Ϣ����
	 * @param mutterString �����Ϣ�ַ���
	 * @return resultString������������Ϣ
	 */
	public String addAnonymousMutter(String mutterString){
		/*
		 * sql: insert into t_mutter_msg(mt_author,mt_publishdate,mt_topic,mt_content,mt_state,mt_hotstate,mt_theme,mt_tag) 
		 *      values('�������',now(),'���һ��','mutterString','0','0',null,null);
		 */
		String resultString = "";
		
        String sqlString = "insert into t_mutter_msg(mt_author,mt_publishdate,mt_topic,mt_content,mt_state,mt_hotstate,mt_theme,mt_tag)" 
        	             + " values('�������',now(),'���һ��','" + mutterString + "','0','0',null,null)";
		
        int mutterState = this.getJdbcTemplate().update(sqlString);
        
        if(mutterState == 1){
        	//�����¼�ɹ�
        	sqlString = "select max(mt_id) from t_mutter_msg";
        	resultString = "��ϲ���������˱�վ��" + this.getJdbcTemplate().queryForInt(sqlString) + "����죬�о��õ�����^_^";
        }else{
        	//�����¼ʧ��
        	resultString = "Sorry,�ƺ����˵����⣬��������԰ɡ�";        	
        }
	
		return resultString;
	}
	
	/**
	 * ��������б���Ϣ
	 * ������ӷ�ҳ��Ҫ���ݵĲ���
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<MutterVO> fetchMutterList(int pageNo){
	    
		List<MutterVO> mutterList = new ArrayList<MutterVO>();
		
		int startIndex = (pageNo - 1) * 12;
		int pageSize = 12;
		
		String sql = "select mt_id,mt_author,mt_publishdate,mt_topic," 
			       + "mt_content,mt_state,mt_hotstate,mt_theme,mt_tag from t_mutter_msg order by mt_publishdate desc " 
			       + "limit " + startIndex + "," + pageSize;
		
		System.out.println(sql);
		
		List list = this.getJdbcTemplate().queryForList(sql);
        
		Iterator it = list.iterator();
		while (it.hasNext()){
			Map map = (Map)it.next();
			
			MutterVO vo = new MutterVO();
			vo.setMutterId(map.get("mt_id") + "");
			vo.setMutterAuthor(map.get("mt_author") + "");
			vo.setMutterPublishDate(map.get("mt_publishdate") + "");
			vo.setMutterTopic(map.get("mt_topic") + "");
			vo.setMutterContent(map.get("mt_content") + "");
			vo.setMutterState(map.get("mt_state") + "");
			vo.setMutterHotstate(map.get("mt_hotstate") + "");
			vo.setMutterTheme(map.get("mt_theme") + "");
			vo.setMutterTag(map.get("mt_tag") + "");

			mutterList.add(vo);
		}
		
		return mutterList;
	}
	
	/**
	 * ��ȡ����б��ҳ��
	 * @return
	 */
	public int fetchMutterListPageSize(){
		int size = 0;
		
		String sql = "select count(*) page_size from t_mutter_msg";
		
		size = (int)Math.ceil(this.getJdbcTemplate().queryForInt(sql) / 12.0);
		
		return size;
	}
	
	
}
