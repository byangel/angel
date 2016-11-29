package customframework.com.app.atchFile.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import customframework.com.app.atchFile.AtchFileUtil;
import customframework.com.app.atchFile.AtchFileVo;
import customframework.com.cmm.service.impl.ServiceSupport;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;


public class AtchFileServiceImpl extends ServiceSupport{
	
	private EgovIdGnrService atchFileIdgenService;
	
	
	
	/**파일 업로드*/
	@Override
	public void create(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		
		//1.멀티파트로 케스팅
		MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
		
		final Map<String, MultipartFile> files = mrequest.getFileMap();
		final List<MultipartFile> filess = mrequest.getFiles("inputFiles");
		final Iterator<String> filesss = mrequest.getFileNames();
		
		
		//2.modelAndView 객체 생성
		ModelAndView modelAndView = new ModelAndView();
		try{
			//3.command 에 Default Property 값을 설정
			//1.기본 파람 속성 설정- loginId,loginIp,loginNm
			super.setDefaultProperty(request, command);
			
			//this.executeCreate(request, modelAndView, command);//생성 실행
			AtchFileVo atchFileVo = (AtchFileVo)command;
			String atchFileId = atchFileVo.getAtch_file_id();
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			
			if ("".equals(atchFileId) || atchFileId == null) {//파일 마스터 아이디가 존재 하면 스킵.
				EgovTableIdGnrService atchFileIdgenService = (EgovTableIdGnrService)context.getBean("atchFileIdgenService");
				atchFileId = atchFileIdgenService.getNextStringId();
				AtchFileVo tmpAtchFileVo = new AtchFileVo();
				tmpAtchFileVo.setAtch_file_id(atchFileId);
				
				this.setDefaultProperty(request, tmpAtchFileVo);
				
				dao.insert("AtchFileDAO.createMaster", tmpAtchFileVo);
			}
			
			//vo 매핑 하고 서버 경로에 파일 저장
			List atchFileVoList = AtchFileUtil.parseFileInf(multiRequest, atchFileId, "", "");
			
			for(int i=0;i < atchFileVoList.size();i++){
				AtchFileVo tmpAtchFileVo= (AtchFileVo)atchFileVoList.get(i);
				/*if ("".equals(atchFileId) || atchFileId == null) {//파일 마스터 아이디가 존재 하면 스킵.
					dao.insert("AtchFileDAO.createMaster", tmpAtchFileVo);
				}*/
				dao.insert("AtchFileDAO.createDetail", tmpAtchFileVo);
			}
			modelAndView.addObject("command",atchFileVoList);
			
			
			//7.리턴 뷰 설정 - 위 로직에서 에러 나면 뷰설정이 이루어 지지않아서 404에러로 인해 common error 페이지로 간다. 뷰관련 메소드 실행위치를 상위로 이동시키는것을 생각해보자.
			modelAndView.setViewName("jsonView");
		}catch (Exception e) {
			log.error("IGNORE:", e);
			throw e;
		}

	}
	/*@Override
	public void create(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		
		//1.기본 파람 속성 설정- loginId,loginIp,loginNm
		this.setDefaultProperty(request, command);
		//2.viewNm 설정
		String layoutNm = BeanUtils.getProperty(command, "layoutNm");
		String progrmNm = BeanUtils.getProperty(command, "progrmNm");
		String viewNm = "redirect:"+(layoutNm == "default" ? "":"/"+layoutNm) + "/" + progrmNm + "List.do?searchUse";
		BeanUtils.setProperty(command, "viewNm", viewNm);
		
		//3.리턴 메세지 설정
		request.getSession().setAttribute("RETURN_MSG","success.common.insert");
		//3.첨부파일
		//atchFile(request, response, command);
		try{
			//4.create 로직 실행
			this.executeCreate(request, modelMap, command);//생성 실행
		}catch (DuplicateKeyException e) {//중복데이타 쿼리 오류 처리 - 등록 폼으로 이동.
			//1.viewNm 설정
			viewNm =  layoutNm +"/"+ this.programStorePath + progrmNm + "Form";
			BeanUtils.setProperty(command, "viewNm", viewNm);
			//2.레퍼런스데이타 메소드 호출
			this.referenceData(request, modelMap, command);
			//3.리턴 메세지 설정
			request.getSession().setAttribute("RETURN_MSG","중복코드 오류 입니다.");
			//4.폼 플레그 설정
			modelMap.put("registerFlag", "CREATE");
		}catch (DataIntegrityViolationException e) {//DB 릴레이션 오류
			//1.viewNm 설정
			viewNm =  layoutNm +"/"+ this.programStorePath + progrmNm + "Form";
			BeanUtils.setProperty(command, "viewNm", viewNm);
			//2.레퍼런스데이타 메소드 호출
			this.referenceData(request, modelMap, command);
			//3.리턴 메세지 설정
			request.getSession().setAttribute("RETURN_MSG","키가 조합이 잘못 되었습니다.");
			//4.폼 플레그 설정
			modelMap.put("registerFlag", "CREATE");
		}
	}*/
	
	
	@Value(value="#{appConfig['Globals.fileStorePath']}")   
	private String fileStorePath;

	/**파일 다운로드*/
	//@Override
	public ModelAndView read(HttpServletRequest request, HttpServletResponse response, Object command)throws Exception{
		
		try{
			AtchFileVo atchFileVo = (AtchFileVo)command;
			
			AtchFileVo fvo = (AtchFileVo)dao.selectByPk("AtchFileDAO.readDetail", atchFileVo);;
		    
			//String fileStorePath = EgovProperties.getProperty("Globals.fileStorePath");
			String folderName = fvo.getFile_stre_path();
			String fileStreName = fvo.getFile_stre_nm();
			String fileOrignlName = fvo.getFile_orignl_nm();
		    String fileFullPathName = this.fileStorePath + folderName + File.separator + fileStreName;
			
		    AtchFileUtil.downFile(request, response, fileFullPathName, fileOrignlName);
		}catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		return null;
	}
	
	
	//@Override
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, Object command)throws Exception{
		
		//Command Object Binding
		//command = createCommandAndBind(request);
		ModelAndView modelAndView = new ModelAndView();
		try{
			//1.command 에 Default Property 값을 설정
			this.setDefaultProperty(request, command);
			
			//3. 삭제 로직 
			AtchFileVo atchFileVo =(AtchFileVo)command;
			String atchFileId = atchFileVo.getAtch_file_id();
			String frstRegisterId = atchFileVo.getRegister_id();
			
			//1.File Info Select.
			List atchFileVoList = dao.list("AtchFileDAO.listDetail",atchFileVo);
			
			for(int i=0;i<atchFileVoList.size();i++){
				dao.delete("AtchFileDAO.deleteDetail", atchFileVoList.get(i));
			}
			
			//3.Real File Delete.
			AtchFileUtil.deleteFile(atchFileVoList);
			
			//2.Table Data Delete.
			if(atchFileId != null && frstRegisterId == null ){
				dao.delete("AtchFileDAO.deleteMaster", atchFileVo);
			}
			
			//4.targetView 호출
			modelAndView.setViewName("jsonView");
		}catch (Exception e) {
			log.error("IGNORE:", e);
			throw e;
		}
		//리턴뷰 작성
		return modelAndView;
	}

	/**파일 목록*/
	//@Override
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response, Object command) throws Exception{
		
		//Command Object Binding
		//command = createCommandAndBind(request);
		ModelAndView modelAndView = new ModelAndView();
		
		
		//4.리스트 로직 메소드 호출
		//jsonView 로 리턴 하기때문에 result Name 를 command 로 설정한다.
		modelAndView.addObject("command", dao.list("AtchFileDAO.listDetail", command));
		
		//6.targetView 호출
		modelAndView.setViewName("jsonView");
		
		return modelAndView;
	}
	
	public ModelAndView getNextId(HttpServletRequest request,HttpServletResponse response, Object command) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		try{
			//ID 채번
			EgovIdGnrService atchFileIdgenService = (EgovIdGnrService)super.context.getBean("atchFileIdgenService");
			AtchFileVo atchFileVo = new AtchFileVo();
			String atchFileId = atchFileIdgenService.getNextStringId();
			atchFileVo.setAtch_file_id(atchFileId);
			
			//첨부파일 아이디 저장.
			dao.insert("AtchFileDAO.createMaster", atchFileVo);
			
			modelAndView.addObject("command", atchFileVo);
			
			modelAndView.setViewName("jsonView");
		}catch (Exception e) {
			e.printStackTrace();
			//throw e;
		}
		return modelAndView;
	}

}
