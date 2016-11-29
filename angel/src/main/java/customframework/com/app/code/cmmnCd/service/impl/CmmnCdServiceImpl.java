package customframework.com.app.code.cmmnCd.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import customframework.com.app.code.clCd.service.ClCdVo;
import customframework.com.app.code.cmmnCd.service.CmmnCdVo;
import customframework.com.app.code.detailCd.service.DetailCdVo;
import customframework.com.cmm.init.saa.AttrSetterOfApplicationScop;
import customframework.com.cmm.service.impl.ServiceSupport;

/**
 * @author user
 *공통코드(코드ID관리)
 */
@Service
public class CmmnCdServiceImpl extends ServiceSupport {

	@Resource(name="codeInitService")
	public AttrSetterOfApplicationScop codeInitService;
	
	@Override
	public void executeList(HttpServletRequest request,ModelMap modelMap,Object command) throws Exception{
		modelMap.addAttribute("cmdList", dao.list("cmmnCdDao.list", command));
	}
	
	@Override
	public void executeCreate(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		CmmnCdVo cmmnCdVo = (CmmnCdVo)command;
		String cl_cd = cmmnCdVo.getCl_cd();
		String cd_id = cmmnCdVo.getCd_id();
		//1.코드ID 등록
		dao.insert("cmmnCdDao.create", cmmnCdVo);
		//2.어플리케이션 영역에 저장된 코드데이타 업데이트 한다.
		this.codeInitService.excute();
		//3.viewNm 설정
		String layoutNm = cmmnCdVo.getLayoutNm();
		String viewNm = "redirect:"+(layoutNm == "default" ? "":"/"+layoutNm) + "/cmmnCdRead.do?cl_cd="+cl_cd+"&cd_id="+cd_id;
		cmmnCdVo.setViewNm(viewNm);
	}
	
	@Override
	public void executeCreateForm(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		//기본적으로 필요하진 않은 구문 같다...생각해보자.
		modelMap.addAttribute("command", command);
		
	}
	
	@Override
	public void executeRead(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception{
		//한화면에 여러 상세 조회 객체를 표현해야 할때가 있다. 폼 자동바인딩이나 벨리데이션 영향을 받지 않기 때문에 default  "프로그ID+Cmd" 로 설정해준다.
		modelMap.addAttribute("command", dao.selectByPk("cmmnCdDao.read", command)); 
	}
	
	@Override
	public void executeUpdate(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		dao.update("cmmnCdDao.update", command);
	}
	
	@Override
	public void executeUpdateForm(HttpServletRequest request,ModelMap modelMap, Object command)throws Exception {
		modelMap.addAttribute("command", dao.selectByPk("cmmnCdDao.read", command));
	}
	
	
	@Override
	public void executeDelete(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		CmmnCdVo cmmnCdVo = (CmmnCdVo)command;
		String cl_cd = cmmnCdVo.getCl_cd();
		String cd_id = cmmnCdVo.getCd_id();
		
		//1.자식테이블 즉 detailCd 삭제후 코드ID 삭제한다.
		DetailCdVo detailCdVo = new DetailCdVo();
		detailCdVo.setCd_id(cd_id);
		dao.delete("detailCdDao.delete", detailCdVo);
		
		//2.코드ID 삭제
		dao.delete("cmmnCdDao.delete", cmmnCdVo);
		
		//3.어플리케이션 영역에 저장된 코드데이타 업데이트 한다.
		this.codeInitService.excute();
		
		//4.viewNm 설정
		String layoutNm = cmmnCdVo.getLayoutNm();
		String viewNm = "redirect:"+(layoutNm == "default" ? "":"/"+layoutNm) + "/cmmnCdRead.do";
		cmmnCdVo.setViewNm(viewNm);
	}
	
	@Override
	public void referenceData(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		//분류코드  리스트
		ClCdVo clCdVo = new ClCdVo();
		clCdVo.setPageIndex(0);
		modelMap.addAttribute("clCdVoList", dao.list("clCdDao.list", clCdVo));
	}
}
