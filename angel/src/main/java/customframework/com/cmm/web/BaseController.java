package customframework.com.cmm.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.context.WebApplicationContext;

import customframework.com.cmm.service.Service;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

public class BaseController{
	
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "validator")
	protected Validator validator;
	
	@Autowired
	protected WebApplicationContext context;
	
	@Resource(name = "dao")
	protected EgovAbstractDAO dao;
	
    
   
	@ModelAttribute("command")
	public Object formBacking(HttpServletRequest request,  ModelMap modelMap,  @PathVariable String PROGRM_NM) throws Exception{
		
		//init 메소드가 먼저 실행되어야 하는 이유는 modelAttribute 이노테이션을 이용하여 해당 컨트롤러에서 필요로하는  
		//vo객체를 지정하여 자동바인딩이 이루어지게 하는게 목적이다.
		Object objCommand = null;
		try{
			objCommand = (Object)context.getBean(PROGRM_NM+"Vo");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return objCommand;
	}
	

	
	 /**커맨드객체에대한 벨리데이션을 호출한다.
     * @param binder
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder){
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    	binder.registerCustomEditor(Date.class, new CustomDateEditor( dateFormat, true));
    	binder.setValidator(this.validator);
    }
    
    
}
