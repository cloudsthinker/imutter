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
	 * 添加匿名嘟囔信息方法
	 * @param mutterString 嘟囔信息字符串
	 * @return resultString：返回嘟囔的信息
	 */
	public String addAnonymousMutter(String mutterString){
		/*
		 * sql: insert into t_mutter_msg(mt_author,mt_publishdate,mt_topic,mt_content,mt_state,mt_hotstate,mt_theme,mt_tag) 
		 *      values('匿名嘟囔',now(),'嘟囔一下','mutterString','0','0',null,null);
		 */
		String resultString = "";
		
        String sqlString = "insert into t_mutter_msg(mt_author,mt_publishdate,mt_topic,mt_content,mt_state,mt_hotstate,mt_theme,mt_tag)" 
        	             + " values('匿名嘟囔',now(),'嘟囔一下','" + mutterString + "','0','0',null,null)";
		
        int mutterState = this.getJdbcTemplate().update(sqlString);
        
        if(mutterState == 1){
        	//插入记录成功
        	sqlString = "select max(mt_id) from t_mutter_msg";
        	resultString = "恭喜您，发出了本站第" + this.getJdbcTemplate().queryForInt(sqlString) + "次嘟囔，感觉好点了吗？^_^";
        }else{
        	//插入记录失败
        	resultString = "Sorry,似乎出了点问题，请过会试试吧。";        	
        }
	
		return resultString;
	}
	
	/**
	 * 返回嘟囔列表信息
	 * 将来添加分页需要传递的参数
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
	 * 获取嘟囔列表的页数
	 * @return
	 */
	public int fetchMutterListPageSize(){
		int size = 0;
		
		String sql = "select count(*) page_size from t_mutter_msg";
		
		size = (int)Math.ceil(this.getJdbcTemplate().queryForInt(sql) / 12.0);
		
		return size;
	}
	
	
}
