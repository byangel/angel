package customframework.com.cmm.init.service;

import javax.servlet.ServletContext;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.web.context.WebApplicationContext;

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
public abstract class ServletContextInit extends JdbcDaoSupport implements ApplicationContextAware{
	
	//어플리케이션 영영에 새로 추가.
	//기존 속성에 추가(List 타입이나 Map 타입이야한다.)
	protected ServletContext servletContext;
	
	//어플리케이션 영영에 저장될 속성명
	private String attributeName="noName";//ServletContext 에 저장될 이름을 지정
	
	//어플리케이션 영영에 저장될 속성의 값
	private Object attributeValue;//ServletContext 에 저장될 값을 지정
	
	//데이타추상메소드 호출여부 - 기글래스를 상속한(추상메소드(dataLoad) 재정의한 클래스) 클래스가 없거나 사용하지 않을경우 default로 설정해주자.
	private boolean dataLoadDisable = false;
	
	
	public boolean excute(ServletContext servletContext, String attributeName, Object attributeValue) throws Exception { 
		
		this.attributeName = attributeName;
		this.attributeValue = attributeValue;
		this.servletContext = servletContext;
		this.dataLoadDisable = true;//하위테이블에서  verride 를하지 않고 직접 값을 주입시킬때 플레그 값을 false 로 해주자.
		return this.excute();
    } 
	public boolean excute() throws Exception { 
		boolean returnValue = false;
		if(!this.dataLoadDisable){
			this.attributeValue = this.dataLoad();
		}
		
		//속성명을 체킹하고 servletContext 개채도 null이 아닌지 체킹 한다.
		if(attributeName != null && !attributeName.equals(" ") && !attributeName.equals("") && this.servletContext!=null){
			servletContext.setAttribute(this.attributeName, this.attributeValue);
			returnValue = true;
		}
		
		return returnValue;
    } 
	
	//어플리케이션 영역에 저장할 속성데이타를 재정의 해야한다면 아래 추상메소드를 하위클래스에서 Override 한다.
	public abstract Object dataLoad();
	
    
	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		WebApplicationContext context = (WebApplicationContext) arg0;
		servletContext = context.getServletContext();
	}
	
	
	
	
	
	public void setDataLoadDisable(boolean dataLoadDisable) {
		this.dataLoadDisable = dataLoadDisable;
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
    
}
