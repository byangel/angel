package customframework.com.cmm.init.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Required;

import customframework.com.cmm.init.service.ServletContextInit;

/**
 * AppScopeInit 서비스의 프로바이더 클래스
 * <p>
 * <b>NOTE</b>: 이 프로바이더 클래스를 통해 실제  어플리케이션 영역에 저장할 데이타를 가공하여 리턴시킨다.
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
public class CodeInitImpl  extends ServletContextInit{

	
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
	public Object dataLoad(){
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
