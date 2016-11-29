package customframework.com.cmm.init.service.impl;

import java.util.List;
import java.util.Map;

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
public class UserInfoListInitImpl  extends ServletContextInit{

	
	private String findUserInfoListSql;
	
	@Required
	public void setFindUserInfoListSql(String findUserInfoListSql) {
		this.findUserInfoListSql = findUserInfoListSql;
	}
	
	
	@Override
	public Object dataLoad(){
		
		List<Map<String,Object>> userList = super.getJdbcTemplate().queryForList(this.findUserInfoListSql);
		
		return userList;
	}
	
}
