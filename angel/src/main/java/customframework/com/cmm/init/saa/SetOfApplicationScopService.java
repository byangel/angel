package customframework.com.cmm.init.saa;

import javax.servlet.ServletContext;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.WebApplicationContext;

import customframework.com.cmm.init.saa.service.PropStrategy;

/**
 * was 기동시 메모리상에(appliction Scope) 데이타를 저장해준다.
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
public class SetOfApplicationScopService  implements ApplicationContextAware{
	
	//어플리케이션 영영에 새로 추가.
	//기존 속성에 추가(List 타입이나 Map 타입이야한다.)
	protected ServletContext servletContext;
	
	//어플리케이션 영영에 저장될 속성명
	
	private String attributeName;//ServletContext 에 저장될 이름을 지정
	@Required
	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
	public Object getAttributeValue() {
		return attributeValue;
	}
	
	//어플리케이션 영영에 저장될 속성의 값
	private Object attributeValue;//ServletContext 에 저장될 값을 지정
	
	private PropStrategy propStrategy;
	@Required
	public void setPropStrategy(PropStrategy propStrategy) {
		this.propStrategy = propStrategy;
	}
	
	public String getAttributeName() {
		return attributeName;
	}
	
	
	public void setAttributeValue(Object attributeValue) {
		this.attributeValue = attributeValue;
	}
	
	
	public void excute() throws Exception { 
		if(this.attributeValue == null){
			this.attributeValue = propStrategy.getData();
		}
		servletContext.setAttribute(this.attributeName, this.attributeValue);
    } 
	
 
	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		WebApplicationContext context = (WebApplicationContext) arg0;
		servletContext = context.getServletContext();
	}
		
    
}
