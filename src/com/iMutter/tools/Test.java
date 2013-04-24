package com.iMutter.tools;

import java.util.List;
import java.util.Iterator;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Component;

@Component
public class Test extends JdbcDaoSupport{

	public void testDB(){
		String idString = "";
		
		System.out.println("before sql execute!");
        List list = this.getJdbcTemplate().queryForList("select id from test");
        System.out.println("after sql execute!");
        
		Iterator it = list.iterator();
		while (it.hasNext()){
			Map map = (Map)it.next();			
			idString = idString + map.get("ID") + ",";
		}
		
		System.out.println("idString is:" + idString);
	}

}
