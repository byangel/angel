package customframework.com.cmm.web;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import customframework.com.cmm.service.Service;
import customframework.com.cmm.service.impl.ServiceSupport;


@Controller
public class CommonController extends BaseController{
	
	@RequestMapping(value={"/{LAYOUT_NM}/{PROGRM_NM}CreateForm.do"}, method=RequestMethod.GET)
    public String createForm(HttpServletRequest request
    						,@PathVariable String PROGRM_NM
    						,@PathVariable String LAYOUT_NM
    						,@ModelAttribute("command")Object command
    						,ModelMap modelMap)throws Exception {
		
		try{
			
			request.setAttribute("layoutNm", LAYOUT_NM);
			request.setAttribute("progrmNm", PROGRM_NM);
    		Service service=null;
    		String beanName = PROGRM_NM+"ServiceImpl";
    		if(context.containsBean(beanName)){
    			service = (ServiceSupport)context.getBean(beanName);
    		}else{
    			service = (ServiceSupport)context.getBean("defaultServiceImpl");
    		}
    		
    		service.createForm(request,modelMap,command);

    		String viewNm = BeanUtils.getProperty(command, "viewNm");
    		return viewNm;
    	}catch (Exception e) {
			
			super.log.error("예외가 발생했어요!!:",e);
			throw e;
		}
    }
    
    @RequestMapping(value={"/{LAYOUT_NM}/{PROGRM_NM}Create.do"}, method=RequestMethod.POST)
    public String create(HttpServletRequest request
    					,@PathVariable String PROGRM_NM
    					,@PathVariable String LAYOUT_NM
			    		,@Valid @ModelAttribute("command") Object command
			    		,BindingResult bindingResult 
			    		,Locale locale
			    		,ModelMap modelMap)throws Exception {
    	
    	try{
    		request.setAttribute("layoutNm", LAYOUT_NM);
    		request.setAttribute("progrmNm", PROGRM_NM);
    		Service service=null;
    		String beanName = PROGRM_NM+"ServiceImpl";
    		if(context.containsBean(beanName)){
    			service = (ServiceSupport)context.getBean(beanName);
    		}else{
    			service = (ServiceSupport)context.getBean("defaultServiceImpl");
    		}
    		
			if(bindingResult.hasErrors()){//에러가 있다면 폼뷰로 이동
				service.getCreateValidError(request, modelMap, command);
			}else{
				service.create(request, modelMap, command);
			}
    		String viewNm = BeanUtils.getProperty(command, "viewNm");
    		return viewNm;
		}catch(Exception e){
			throw e;
		}
    }
    
    
    @RequestMapping(value={"/{LAYOUT_NM}/{PROGRM_NM}Read.do"})
    public String read(HttpServletRequest request
    					,@PathVariable String PROGRM_NM
    					,@PathVariable String LAYOUT_NM
    					,@ModelAttribute("command")Object command
    		 			,ModelMap modelMap)throws Exception {
    	
    	try{
    		request.setAttribute("layoutNm", LAYOUT_NM);
    		request.setAttribute("progrmNm", PROGRM_NM);
    		Service service=null;
    		String beanName = PROGRM_NM+"ServiceImpl";
    		if(context.containsBean(beanName)){
    			service = (ServiceSupport)context.getBean(beanName);
    		}else{
    			service = (ServiceSupport)context.getBean("defaultServiceImpl");
    		}
    		service.read(request, modelMap, command);
    		
    		String viewNm = BeanUtils.getProperty(command, "viewNm");
    		return viewNm;
		}catch(Exception e){
			super.log.error("예외가 발생했어요!!:",e);
			throw e;
			//return "errorPage";
		}
    }
    
    @RequestMapping(value={"/{LAYOUT_NM}/{PROGRM_NM}UpdateForm.do"}, method=RequestMethod.GET)
    public String updateForm(HttpServletRequest request
    						,@PathVariable String PROGRM_NM
    						,@PathVariable String LAYOUT_NM
    						,@ModelAttribute("command")Object command
    						,ModelMap modelMap)throws Exception {
    	
    	try{
    		request.setAttribute("layoutNm", LAYOUT_NM);
    		request.setAttribute("progrmNm", PROGRM_NM);
    		Service service=null;
    		String beanName = PROGRM_NM+"ServiceImpl";
    		if(context.containsBean(beanName)){
    			service = (ServiceSupport)context.getBean(beanName);
    		}else{
    			service = (ServiceSupport)context.getBean("defaultServiceImpl");
    		}
    		
    		service.updateForm(request, modelMap, command);
    		
    		String viewNm = BeanUtils.getProperty(command, "viewNm");
    		return viewNm;
    	}catch (Exception e) {
			super.log.error("예외가 발생했어요!!:",e);
			throw e;
		}
    }
    
    @RequestMapping(value={"/{LAYOUT_NM}/{PROGRM_NM}Update.do"}, method=RequestMethod.POST)
    public String update(HttpServletRequest request
    		,@PathVariable String PROGRM_NM
    		,@PathVariable String LAYOUT_NM
    		,@Valid @ModelAttribute("command") Object command
    		,BindingResult bindingResult
    		,Locale locale
    		,ModelMap modelMap)throws Exception {
    	
    	try{
    		request.setAttribute("layoutNm", LAYOUT_NM);
    		request.setAttribute("progrmNm", PROGRM_NM);
    		Service service=null;
    		String beanName = PROGRM_NM+"ServiceImpl";
    		if(context.containsBean(beanName)){
    			service = (ServiceSupport)context.getBean(beanName);
    		}else{
    			service = (ServiceSupport)context.getBean("defaultServiceImpl");
    		}
    		
    		//벨리데이션 에러가 있을경우  폼뷰로 이동
    		if(bindingResult.hasErrors()){
    			service.getUpdateValidError(request, modelMap, command);
    		}else{
    			service.update(request, modelMap, command);
    		}
    		
    		String viewNm = BeanUtils.getProperty(command, "viewNm");
    		return viewNm;
    	}catch(Exception e){
    		throw e;
    	}
    }
    
  
    @RequestMapping(value = {"/{LAYOUT_NM}/{PROGRM_NM}Delete.do"})
    public String delete(HttpServletRequest request
    					,@PathVariable String PROGRM_NM
    					,@PathVariable String LAYOUT_NM
    					,@ModelAttribute("command")Object command
    		 			,ModelMap modelMap)throws Exception {
    	
    	try{
    		request.setAttribute("layoutNm", LAYOUT_NM);
    		request.setAttribute("progrmNm", PROGRM_NM);
    		Service service=null;
    		String beanName = PROGRM_NM+"ServiceImpl";
    		if(context.containsBean(beanName)){
    			service = (ServiceSupport)context.getBean(beanName);
    		}else{
    			service = (ServiceSupport)context.getBean("defaultServiceImpl");
    		}
    		
    		service.delete(request, modelMap, command);
    		
    		String viewNm = BeanUtils.getProperty(command, "viewNm");
    		return viewNm;
		}catch(Exception e){
			super.log.error("예외가 발생했어요!!:",e);
			throw e;
		}
    	
    }
    
    @RequestMapping(value={"/{LAYOUT_NM}/{PROGRM_NM}List.do"})
    public String list( HttpServletRequest request
    					,@PathVariable String PROGRM_NM
    					,@PathVariable String LAYOUT_NM
    					,@ModelAttribute("command")Object command
    					,ModelMap modelMap )throws Exception {
    	
    	try{
    		request.setAttribute("layoutNm", LAYOUT_NM);
    		request.setAttribute("progrmNm", PROGRM_NM);
    		Service service=null;
    		String beanName = PROGRM_NM+"ServiceImpl";
    		if(context.containsBean(beanName)){
    			service = (ServiceSupport)context.getBean(beanName);
    		}else{
    			service = (ServiceSupport)context.getBean("defaultServiceImpl");
    		}
    		
    		service.list(request, modelMap, command);
    		
    		String viewNm = BeanUtils.getProperty(command, "viewNm");
    		return viewNm;
    	}catch(Exception e){
    		super.log.error("예외가 발생했어요!!:",e);
    		throw e;
    	}
    }
    
    @RequestMapping(value={"/{LAYOUT_NM}/{PROGRM_NM}Mng.do"})
    public String mng( HttpServletRequest request
    					,@PathVariable String PROGRM_NM
    					,@PathVariable String LAYOUT_NM
    					,@ModelAttribute("command")Object command
    					,ModelMap modelMap )throws Exception {
    	
    	try{
    		request.setAttribute("layoutNm", LAYOUT_NM);
    		request.setAttribute("progrmNm", PROGRM_NM);
    		Service service=null;
    		String beanName = PROGRM_NM+"ServiceImpl";
    		if(context.containsBean(beanName)){
    			service = (ServiceSupport)context.getBean(beanName);
    		}else{
    			service = (ServiceSupport)context.getBean("defaultServiceImpl");
    		}
    		
    		service.manager(request, modelMap, command);
    		
    		String viewNm = BeanUtils.getProperty(command, "viewNm");
    		return viewNm;
    	}catch(Exception e){
    		super.log.error("예외가 발생했어요!!:",e);
    		throw e;
    	}
    }
    
}
