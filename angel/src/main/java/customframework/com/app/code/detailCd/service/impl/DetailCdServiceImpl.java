package customframework.com.app.code.detailCd.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import customframework.com.app.code.clCd.service.ClCdVo;
import customframework.com.app.code.cmmnCd.service.CmmnCdVo;
import customframework.com.app.code.detailCd.service.DetailCdVo;
import customframework.com.cmm.init.saa.AttrSetterOfApplicationScop;
import customframework.com.cmm.service.impl.ServiceSupport;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service
public class DetailCdServiceImpl extends ServiceSupport {

	@Resource(name="codeInitService")
	public AttrSetterOfApplicationScop codeInitService;
	
	//리스트 호출할때 searchVO에 업데이트 정보나 등록 데이타가 넘어올때 처리 하려고 하였으나 조건 저장시 목록데이타도 같이 저장되는문제와 
	//searchForm 을 같이쓰면  업데이토 목록 데이타가 같이 넘어간다. 그래서 
	//결론은 일단 리스트페이지에서 다수의 값을 저장및 수정을 해야한다면...create메소드에서 처리해주자.
	//기본적인 코드정보 등록 외에 어플리케이션 여역에 저장되어있는 코드데이타도 같이 변경해야하기때문에 따로 재구현함...
	@Override
	public void executeCreate(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		DetailCdVo detailCdVo = (DetailCdVo)command;
		
		//리스트페이지에서 다수의 등록및 수정건이 들어왔을때 처리해준다.
		//지금은 executeCreate를 재정의 해주지만 새로은 url을 만들어 ctrl부터 새로 만들수도 있다.
		List<DetailCdVo> detailCdVoList = detailCdVo.getDetailCdVoList();//새로 등록할 Vo
		DetailCdVo tmpDetailCdVo = null;
		if(detailCdVoList != null){
			EgovIdGnrService idGnrService  = (EgovIdGnrService)context.getBean("detailCdIdGnrService");
			String nextId = "";
			
			for(int i=0;i<detailCdVoList.size();i++){
				tmpDetailCdVo = detailCdVoList.get(i);
				//1.기본 파람 속성 설정
				super.setDefaultProperty(request, tmpDetailCdVo);
				
				nextId = idGnrService.getNextStringId();
				tmpDetailCdVo.setItemId(nextId);
				dao.insert("detailCdDao.create", tmpDetailCdVo);   
			}
		}
		List<DetailCdVo> upDtailCdVoList = detailCdVo.getUpDetailCdVoList(); //업데이트 할 Vo
		if(upDtailCdVoList != null){
			String changeAt = "";
			for(int i=0;i<upDtailCdVoList.size();i++){
				tmpDetailCdVo = upDtailCdVoList.get(i);
				changeAt = tmpDetailCdVo.getChangeAt();
				if(changeAt!="" && changeAt != null){
					dao.update("detailCdDao.listUpdate", tmpDetailCdVo);
				}
			}
		}
		
		
		//리스트페이지에서 등록건vo와 수정건vo가 없을경우에 등록페이지에서 1건요청하는걸로 간주한다.
		if(detailCdVoList==null && upDtailCdVoList==null){ 
			//1.코드ID 등록
			dao.insert("detailCdDao.create", detailCdVo);
			//3.viewName 설정 디폴트로 등록시 리스트페이지로 설정되는데 기기능 특성상 1건등록시 리드페이지로 가도록 설정한다.
			String layoutNm = (String)request.getAttribute("layoutNm");
			String viewNm = "redirect:"+(layoutNm == "default" ? "":"/"+layoutNm) + "/detailCdRead.do?detail_cd_id="+detailCdVo.getItemId();
			detailCdVo.setViewNm(viewNm);
		}
		
		//2.어플리케이션 영역에 저장된 코드데이타 업데이트 한다.
		this.codeInitService.excute();
		
		
	}
	
	@Override
	public void executeUpdate(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		//1.코드ID 수정
		dao.update("detailCdDao.update", command);
		
		//2.어플리케이션 영역에 저장된 코드데이타 업데이트 한다.
		this.codeInitService.excute();
		
	}
	
	@Override
	public void executeUpdateForm(HttpServletRequest request,ModelMap modelMap, Object command)throws Exception {
		modelMap.addAttribute("command", dao.selectByPk("detailCdDao.read", command));
	}
	
	
	@Override
	public void executeDelete(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		DetailCdVo detailCdVo = (DetailCdVo)command;
		//1.상세 코드 삭제
		dao.delete("detailCdDao.delete", detailCdVo);
		//2.어플리케이션 영역에 저장된 코드데이타 업데이트 한다.
		this.codeInitService.excute();
		
		//3.viewName 설정 - 기본 list 페이지로 가지않고 빈 Read 페이지로 이동하도록 설정
		String layoutNm = (String)request.getAttribute("layoutNm");
		String viewNm = "redirect:"+(layoutNm == "default" ? "":"/"+layoutNm) + "/detailCdRead.do";
		detailCdVo.setViewNm(viewNm);
	}
	
	
	@Override
	public void referenceData(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		//코드 아이디 리스트
		CmmnCdVo cmmnCdVo = new CmmnCdVo();
		cmmnCdVo.setPageIndex(0);
		modelMap.addAttribute("cmmnCdVoList", dao.list("cmmnCdDao.list",cmmnCdVo));
		
		//분류코드 아이디 리스트
		ClCdVo clCdVo = new ClCdVo();
		clCdVo.setPageIndex(0);
		modelMap.addAttribute("clCdVoList", dao.list("clCdDao.list", clCdVo));
	}
}
