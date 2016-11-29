package customframework.com.cmm.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;


/**
 * @author neloi
 *
 */
public interface Service {
	
	/**생성 로직 정의 */
	void create(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	/**읽기  로직 정의*/
	void read(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	/**업데이트 로직 정의 */
	void update(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	/**삭제 로직 정의 */
	void delete(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	/**리스트 로직 정의 */
	void list(HttpServletRequest request, ModelMap modelMap, Object command) throws Exception;
	
	Integer listTotalCount(HttpServletRequest request,ModelMap modelMap, Object command) throws Exception;
	
	/** 생성 폼 페이지 호출시 로직 정의 */
	void createForm(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	/** 업데이트 폼 페이지 호출시 로직 정의 */
	void updateForm(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	/** 팝업 페이지 호출시 로직 정의 */
	void popup(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	/** 메니져 페이지 호출시 로직 정의 */
	void manager(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	/** 공통 데이타  로직 정의 */
	void referenceData(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	void getCreateValidError(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception;
	
	void getUpdateValidError(HttpServletRequest request,ModelMap modelMap, Object command)throws Exception;
}