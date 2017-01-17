package customframework.com.cmm.init.saa.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import customframework.com.cmm.init.saa.service.PropStrategy;

/**
 * 
 * <p>
 * <b>NOTE</b>: 코드 데이타를 맵에 담아서 리턴한다.
 * 
 * @author 김용성
 * @since 2012.08.27
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 * 
 *   수정일              수정자           수정내용
 *  -------     --------   ---------------------------
 *   2012.08.27  김용성           최초 생성
 * 
 * </pre>
 */
public class CodeStrategyImpl  extends JdbcDaoSupport implements PropStrategy{

	
	private String findCodeIdSql;  
	private String findDetailCodeSql;
	
	@Required
	public void setFindDetailCodeSql(String findDetailCodeSql) {
		this.findDetailCodeSql = findDetailCodeSql;
	}
	@Required
	public void setFindCodeIdSql(String findCodeIdSql) {
		this.findCodeIdSql = findCodeIdSql;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Object getData() throws Exception {
		Map<String,Object> codeMap = new HashedMap();
		List<String> codeIdList = super.getJdbcTemplate().queryForList(findCodeIdSql, String.class);
		
		String codeId=null;
		List<Map<String,Object>> detailCodeList;
		
		for(int i=0;i<codeIdList.size();i++){
			codeId = codeIdList.get(i);
			//공통코드 아이디로 디테일 코드 리스트를 구하고 코드맵에 저장한다.
			detailCodeList = super.getJdbcTemplate().queryForList(this.findDetailCodeSql,new Object[] {codeId});
			codeMap.put(codeId, detailCodeList);	
		}
		return codeMap;
	}
	
	 
}
