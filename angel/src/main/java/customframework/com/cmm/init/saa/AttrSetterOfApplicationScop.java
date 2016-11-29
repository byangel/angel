package customframework.com.cmm.init.saa;

import javax.servlet.ServletContext;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.web.context.WebApplicationContext;

import customframework.com.cmm.init.saa.service.InitDataProvider;

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
public class AttrSetterOfApplicationScop  implements ApplicationContextAware{
	
	//어플리케이션 영영에 새로 추가.
	//기존 속성에 추가(List 타입이나 Map 타입이야한다.)
	protected ServletContext servletContext;
	
	//어플리케이션 영영에 저장될 속성명
	private String attributeName="noName";//ServletContext 에 저장될 이름을 지정
	
	//어플리케이션 영영에 저장될 속성의 값
	private Object attributeValue;//ServletContext 에 저장될 값을 지정
	
	private InitDataProvider initDataProvider;
	
	
	
	public void setInitDataProvider(InitDataProvider initDataProvider) {
		this.initDataProvider = initDataProvider;
	}
	public String getAttributeName() {
		return attributeName;
	}
	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
	public Object getAttributeValue() {
		return attributeValue;
	}
	public void setAttributeValue(Object attributeValue) {
		this.attributeValue = attributeValue;
	}
	
	
	public void excute() throws Exception { 
		if(this.attributeValue == null){
			this.attributeValue = initDataProvider.getData();
		}
		servletContext.setAttribute(this.attributeName, this.attributeValue);
    } 
	
 
	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		WebApplicationContext context = (WebApplicationContext) arg0;
		servletContext = context.getServletContext();
	}
		
    
}
