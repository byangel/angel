package customframework.com.cmm.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import customframework.com.app.atchFile.service.AtchFileServiceImpl;
import customframework.com.cmm.service.Service;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * @author neloi
 *
 */
public class ServiceSupport  extends AbstractServiceImpl  implements Service {
	

	@Resource(name = "dao")
	protected EgovAbstractDAO dao;
	@Autowired
	protected WebApplicationContext context;
	
	@Resource(name="egovMessageSource")
	protected EgovMessageSource egovMessageSource;
	
	//@Resource(name = "EgovFileMngService")
	//private EgovFileMngService fileMngService;

	//@Resource(name = "EgovFileMngUtil")
	//private EgovFileMngUtil fileUtil;
	

	
	
	/**공통 서비스 인터페이스 구현*/
	@Override
	public void createForm(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		
		//1.게시판 기능 처럼 파람을 유지해야하는 경우 때문에 추가한다. 다른 기능에서 정상 동작하는지 확인 해야한다.이상이 있다면 bbs_id를 session 영역에서 컨트롤 하자.
		//1.리스트에서 CRUD 를위한 Ifram을 사용할경우 vo를 같이 쓰기때문에 layoutNm 값이나 progrmNm값을 공유하기때문에 문제가 생긴다.
		//layoutNm 및 progrmNm 값을 다른곳에저장하는것을 생각해보자...이전에는 request 영역에 저장했는데 redirect 시 문제가 있었던것같다...그래서 vo에 저장했는데...
		// 어찌 됬든 vo에 저장하는것은 바람직하지 않은듯 하단. 일단 아래 강제로 sessionToSearchParam 호출하는 부분은 삭제해야겠다...
		//게시판 같은경우는 자제 프로그램에서(serviceImpl) 해결을 해야할것 같다.
		//request.setAttribute("searchUse", "");
		//this.sessionToSearchParam(request, command);
		//2.기본 파람 속성 설정
		this.setDefaultProperty(request, command);
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm  + "Form";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		//3.registerFlag 설정
		modelMap.addAttribute("registerFlag", "CREATE");
		//4.레퍼런스데이타 메소드 호출 - 예외 처리시 호출이 되지 않는다.execute 메소드 호출 전에 위치 시키자.
		this.referenceData(request, modelMap, command);
		//5.create 로직 호출
		this.executeCreateForm(request, modelMap, command);
	}
	
	
	@Override
	public void updateForm(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		//1.기본 파람 속성 설정
		this.setDefaultProperty(request, command);
		
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm + "Form";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		//3.registerFlag 설정
		modelMap.addAttribute("registerFlag", "UPDATE");
		//4.레퍼런스데이타 메소드 호출
		this.referenceData(request, modelMap, command);
		//5.updateForm 로직 실행
		this.executeUpdateForm(request, modelMap, command);
	}
	
	
	@Override
	public void create(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		
		//AtchFileServiceImpl AtchFileServiceImpl = new AtchFileServiceImpl();
		//AtchFileServiceImpl.create(request, modelMap, command);
		
		//1.기본 파람 속성 설정
		this.setDefaultProperty(request, command);
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		//2.첨부파일
		//atchFile(request, response, command);
		
		String viewNm = null;
		try{
			//3.리턴 메세지 설정
			request.getSession().setAttribute("RETURN_MSG","success.common.insert");
			
			//1.idGnrService 구현체 객체를 구한다.
			if(context.containsBean(progrmNm+"IdGnrService")){
    			EgovIdGnrService idGnrService  = (EgovIdGnrService)context.getBean(progrmNm+"IdGnrService");
				//3.IDS를 이용 유니크 아이디를 구한다.
				String nextId = idGnrService.getNextStringId();
				//4.Insert에 필요한 유니크 아이디를 구한후 커맨드 객체에 저장한다.itemId 는 defaultVo에 선언 되어있다.
				BeanUtils.setProperty(command, "itemId", nextId);
    		}else{
    			super.log.info("customFramework Message:'"+progrmNm+"' 해당 IDS 사용 안함.");
    		}
			//viewNm 값은 executeCreate 이전에 설정하는 이유는 executeCreate에서 제정의 할 경우를 대비하여 이전에 설정해 놓는다.
			viewNm = "redirect:"+(layoutNm == "default" ? "":"/"+layoutNm) + "/" + progrmNm + "List.do?searchUse";
			BeanUtils.setProperty(command, "viewNm", viewNm);
			//4.create 로직 실행
			this.executeCreate(request, modelMap, command);//생성 실행
		}catch (DuplicateKeyException e) {//중복데이타 쿼리 오류 처리 - 등록 폼으로 이동.
			//1.viewNm 설정
			viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm + "Form";
			BeanUtils.setProperty(command, "viewNm", viewNm);
			//2.레퍼런스데이타 메소드 호출
			this.referenceData(request, modelMap, command);
			//3.리턴 메세지 설정
			request.getSession().setAttribute("RETURN_MSG","중복코드 오류 입니다.");
			//4.폼 플레그 설정
			modelMap.put("registerFlag", "CREATE");
		}catch (DataIntegrityViolationException e) {//DB 릴레이션 오류
			//1.viewNm 설정
			viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm + "Form";
			BeanUtils.setProperty(command, "viewNm", viewNm);
			//2.레퍼런스데이타 메소드 호출
			this.referenceData(request, modelMap, command);
			//3.리턴 메세지 설정
			request.getSession().setAttribute("RETURN_MSG","DB 릴레이션 오류가 발생하였습니다.");
			//4.폼 플레그 설정
			modelMap.put("registerFlag", "CREATE");
		}
	}
	
	@Override
	public void read(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		
		//1.기본 파람 속성 설정
		this.setDefaultProperty(request, command);
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm + "Read";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		//3.레퍼런스데이타 메소드 호출
		this.referenceData(request, modelMap, command);
		//4.read 로직 호출 - defaultVo 에 상태정보가 들어있다...쿼리후 리절트 값이 이defaultVo 에 다시 담기기 때문에...기존데이타 활용을 다한후 read() 메소드를 호출한다.
		this.executeRead( request, modelMap, command);
	}
	
	
	@Override
	public void update(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		
		//1.기본 파람 속성 설정
		this.setDefaultProperty(request, command);
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm = "forward:"+(layoutNm == "default" ? "":"/"+layoutNm) + "/" + progrmNm + "Read.do";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		//3.리턴 메세지 설정
		request.getSession().setAttribute("RETURN_MSG","success.common.update");
		//4.레퍼런스데이타 메소드 호출
		this.referenceData(request, modelMap, command);
		//5.update 로직 호출
		this.executeUpdate(request, modelMap, command);
	}
	
	@Override
	public void delete(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		
		//1.기본 파람 속성 설정
		this.setDefaultProperty(request, command);
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm = "redirect:"+(layoutNm == "default" ? "":"/"+layoutNm) + "/" + progrmNm + "List.do?searchUse";//삭제후 리스트페이지 호출시 기존 검색 조건 유지하기 위한 명령어.
		BeanUtils.setProperty(command, "viewNm", viewNm);
		//3.첨부 파일 관련 로직-첨부 파일을 삭제 하기위해 atchFileId(첨부파일 아이디)를 구해야 한다. 그래서 default 로 executeRead를  호출한다.
		//게시물 다중 삭제 시 처리
		//attachFileDelete(request, modelMap, command, this.progrmNm);
		//4.delete 로직 호출
		this.executeDelete(request, modelMap, command);
		//5.리턴 메세지 설정
		request.getSession().setAttribute("RETURN_MSG","success.common.delete");
	}

	
	@Override
	public void list(HttpServletRequest request,ModelMap modelMap,Object command) throws Exception{
		//1.기본 파람 속성 설정
		this.setDefaultProperty(request, command);
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm + "List";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		//3.검색조건 처리(원래 1번이였는데확이없이 그냥 2번으로 변경했다 나중에 문제 없는지 확인해보자.
		this.sessionToSearchParam(request, command);
		//4.페이징 쿼리를 위해 리스트를 구하기전에 페이지 정보를 먼저 설정 해야 한다.
		this.executePagenation(request, modelMap, command);
		//5.레퍼런스데이타 메소드 호출
		this.referenceData(request, modelMap, command);
		//6.list 로직 호출
		this.executeList(request, modelMap, command);
		//7.search command 객체 설정
		modelMap.addAttribute("searchCmd", command);
	}
	
	@Override
	public Integer listTotalCount(HttpServletRequest request, ModelMap modelMap, Object command) throws Exception {
		String progrmNm = (String)request.getAttribute("progrmNm");
		
		Integer totalCount = (Integer)this.dao.selectByPk(progrmNm + "Dao.totalCount", command);
		return totalCount;
	}
	
	@Override
	public void popup(HttpServletRequest request, ModelMap modelMap, Object command) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void manager(HttpServletRequest request, ModelMap modelMap, Object command) throws Exception {
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm + "Mng";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		//5.list 로직 호출
		this.executeMng(request, modelMap, command);
	}
	
	@Override
	public void referenceData(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
	}
	
	
	@Override
	public void getCreateValidError(HttpServletRequest request, ModelMap modelMap, Object command) throws Exception{
		
		//1.리턴메세지 설정 RETURN_MSG|
		request.getSession().setAttribute("RETURN_MSG","errors.required.check");
		
		modelMap.put("registerFlag", "CREATE");
		
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm + "Form";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		
		//5.레퍼런스데이타 메소드 호출
		this.referenceData(request, modelMap, command);
		
		
	}
	
	@Override
	public void getUpdateValidError(HttpServletRequest request,ModelMap modelMap, Object command)throws Exception{
		//1.리턴메세지 설정 RETURN_MSG
		request.getSession().setAttribute("RETURN_MSG","errors.required.check");
		modelMap.put("registerFlag", "UPDATE");
		//2.viewNm 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String progrmNm = (String)request.getAttribute("progrmNm");
		String viewNm =  layoutNm +"/" + progrmNm + "/" + progrmNm + "Form";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		//5.레퍼런스데이타 메소드 호출
		this.referenceData(request, modelMap, command);
	}
	
	/**공통 서비스 인터페이스 구현 끝*/
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	/**CRUD Start*/
	/**
	 * -해당 프로그램이름으로된 IDS객체가 존재하지 않으면 쿼리에서 처리하는것으로 간주하고  insert 쿼리를 호출한다.
	 * -Insert에 필요한 유니크 아이디를 구한후 커맨드 객체에 "itemId" 속성 이름으로 저장한다.
	 * -IDS는 예를 들어 게시판에 파일업로드 기능이 있다고 하자...이때  미리 유니크ID를 안다면 파일업로드를 미리 업로드가 가능해지기 때문에 IDS를 사용하면 편하다.
	 * -ID가 미리 필요한경우 는 createForm 에서 필요하다.나머지는 쿼리에서 ID를 생성하고 ...일반적이지 않은곳에서는 하위클래스에서 오버라이딩 하자.
	 * -자동 IDS는 사용하지 않는다. 게시판 같은경우 createForm 에서 사용 해야할것같다.
	 */
	public void executeCreateForm(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		modelMap.addAttribute("command", command);
	}
	
	
	public void executeCreate(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		String progrmNm = (String)request.getAttribute("progrmNm");
		//5.등록쿼리 호출
		dao.insert(progrmNm + "Dao.create", command);
	}
	
	public void executeUpdateForm(HttpServletRequest request,ModelMap modelMap, Object command)throws Exception {
		String progrmNm = (String)request.getAttribute("progrmNm");
		modelMap.addAttribute("command", dao.selectByPk(progrmNm + "Dao.read", command));
	}
	
	public void executeUpdate(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		String progrmNm = (String)request.getAttribute("progrmNm");
		dao.update(progrmNm + "Dao.update", command);
	}
	
	public void executeRead(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception{
		//한화면에 여러 상세 조회 객체를 표현해야 할때가 있다. 폼 자동바인딩이나 벨리데이션 영향을 받지 않기 때문에 default  "프로그ID+Cmd" 로 설정해준다.
		String progrmNm = (String)request.getAttribute("progrmNm");
		modelMap.addAttribute("command", dao.selectByPk(progrmNm + "Dao.read", command)); 
	}
	
	public void executeDelete(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		String progrmNm = (String)request.getAttribute("progrmNm");
		dao.delete(progrmNm + "Dao.delete", command);
	}
	
	
	public void executeList(HttpServletRequest request,ModelMap modelMap,Object command) throws Exception{
		String progrmNm = (String)request.getAttribute("progrmNm");
		modelMap.addAttribute("cmdList", dao.list(progrmNm + "Dao.list", command));
	}
	public void executeMng(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception{
		
	}
	
	
	//CRUD end
	
	
	
	//기본 프로퍼티 값을 설정한다. loginId,loginIp,loginNm
	public void setDefaultProperty(HttpServletRequest request, Object command)throws Exception {
				String userSe = "";//userInfoVo.getUser_se();//사용자 구분
				
				String loginId = "ANONY";//userInfoVo.getUser_id();
				String loginIp = request.getRemoteAddr();
				String loginNm = null; 
				
			    //Spring scurity 추가하면 설정해주자.
			    /*if(CustomUserDetailsHelper.isAuthenticated()){
			    	CommonDefaultVo usermanageVo = (CommonDefaultVo)CustomUserDetailsHelper.getAuthenticatedUser();
					
			    	loginId = usermanageVo.getregister_id();
					userName = usermanageVo.getRegister_nm();
				}*/
			    
			    BeanUtils.setProperty(command, "loginId", loginId);
			    BeanUtils.setProperty(command, "loginNm", loginNm);
				BeanUtils.setProperty(command, "loginIp", loginIp);
	}
	
	//검색조건을 세션에 저장한다.
	public void sessionToSearchParam(HttpServletRequest request,Object newCommand) throws Exception{
		//하나의 화면에서 여러게 리스트를 사용할경우 를 위해서 커맨드 객체를 맵에 저장한다.
 		Map<String,Object> commandMap =  (Map<String,Object>)request.getSession().getAttribute("SEARCH_CMD_MAP");
 		if(commandMap == null){
 			commandMap = new HashMap<String,Object>();
 		}
 		
 		String newCommandName= newCommand.getClass().getName();
 		Object oldCommand =  commandMap.get(newCommandName);//newCommandName 이름으로된 command 객체가 session 영역에서 참조한다. 
 		
 		//org.apache.commons.beanutils.ConversionException: No value specified for 'Date'
 		BeanUtilsBean.getInstance().getConvertUtils().register(false, false, 0);
 		//리스트 페이지에서 검색
 		if("".equals(request.getParameter("searching"))){
 			commandMap.put(newCommandName, newCommand);
 			request.getSession().setAttribute("SEARCH_CMD_MAP", commandMap);
 		}else if(request.getParameter("pageIndex") != null){//리스트페이지에서 페이징 버튼 클릭시.
 			if(commandMap.containsKey(newCommandName)){//new 이름과 old 이름이 같으면(new 객체이름으로 등록된 command 객체가 있다면.)
 				String ignorePropertyValue = BeanUtils.getProperty(newCommand, "pageIndex");
 				BeanUtils.copyProperties(newCommand,oldCommand);
 				BeanUtils.setProperty(newCommand, "pageIndex", ignorePropertyValue);
 			}
 			commandMap.put(newCommandName, newCommand);
 			request.getSession().setAttribute("SEARCH_CMD_MAP", commandMap);
 		}else if("".equals(request.getParameter("searchUse")) || "".equals(request.getAttribute("searchUse"))){//읽기 화면이나 업데이트화면 에서 리스트페이지 이동 버튼 클릭시
 			if(commandMap.containsKey(newCommandName)){
 				BeanUtils.copyProperties(newCommand, oldCommand);
 			}
 		}else{
 			request.getSession().removeAttribute("SEARCH_CMD_MAP");
 		}
 	}
	
	//페이징 객체를 설정한다.
	public void executePagenation(HttpServletRequest request, ModelMap modelMap, Object command) throws Exception {
		//페이징 관련 해서 뷰페이지에서 현재 페이지와 페이지 싸이즈 그리고 토탈 카운트 정보만 있으면 페이지징을 처리할수있다.
		//totalCount 구한다.
		int totalCount =  this.listTotalCount(request, modelMap, command);
		
		int pageIndex = Integer.parseInt(BeanUtils.getProperty(command, "pageIndex").toString());
		int pageSize  = Integer.parseInt(BeanUtils.getProperty(command, "pageSize").toString());
		int recordCountPerPage  = Integer.parseInt(BeanUtils.getProperty(command, "recordCountPerPage").toString());
		
		//egov pagination 객체 생성
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(pageIndex);
		paginationInfo.setRecordCountPerPage(recordCountPerPage);
		paginationInfo.setPageSize(pageSize);
		paginationInfo.setTotalRecordCount(totalCount);
		int lastPageNo = paginationInfo.getLastPageNo();
		if(pageIndex > lastPageNo){
			paginationInfo.setCurrentPageNo(lastPageNo);
		}
		
		//검색 리스트 쿼리에서 사용할 페이징 정보를 구한다.
		BeanUtils.setProperty(command,"firstIndex",paginationInfo.getFirstRecordIndex());
		BeanUtils.setProperty(command,"lastIndex", paginationInfo.getLastRecordIndex());
		//comDefaultVo 에 pageSize 와 recordCountPerPage 같은 정보인것 같은데 왜 있는지 모르겠다 recordCountPerPage는 주석처리한다. 
		//BeanUtils.setProperty(command,"recordCountPerPage",paginationInfo.getRecordCountPerPage());
		
		modelMap.addAttribute("paginationInfo", paginationInfo);
	}
	
}


