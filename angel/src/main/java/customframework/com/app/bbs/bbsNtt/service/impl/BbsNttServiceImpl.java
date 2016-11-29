package customframework.com.app.bbs.bbsNtt.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import customframework.com.app.bbs.bbsMaster.service.BbsMasterVo;
import customframework.com.app.bbs.bbsNtt.service.BbsNttVo;
import customframework.com.cmm.service.impl.ServiceSupport;

@Service
public class BbsNttServiceImpl extends ServiceSupport {

	@Override
	public void executeList(HttpServletRequest request,ModelMap modelMap,Object command) throws Exception{
		BbsNttVo bbsNttVo = (BbsNttVo)command;
		String bbs_id = bbsNttVo.getBbs_id();
		
		//1.해당 게시판 설정 정보 가져온다.
		if(bbs_id != null){//bbs_id(보드마스터 아이디 값이 없으면 ntt_id를 이용하여 bbs_id를 구한다.
			BbsMasterVo bbsMasterVo = new BbsMasterVo();
			bbsMasterVo.setBbs_id(bbs_id);
			bbsMasterVo = (BbsMasterVo)dao.selectByPk("bbsMasterDao.read", bbsMasterVo);
			request.getSession().setAttribute("bbsMasterVo", bbsMasterVo);
		}
		
		String progrmNm = (String)request.getAttribute("progrmNm");
		modelMap.addAttribute("cmdList", dao.list(progrmNm + "Dao.list", command));
	}
	
	@Override
	public void executeCreate(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		//1.답글 처리
		
		//5.등록쿼리 호출
		dao.insert("bbsNttDao.create", command);
	}
	
	@Override
	public void executeCreateForm(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		BbsNttVo bbsNttVo = (BbsNttVo)command;
		BbsMasterVo bbsMasterVo = (BbsMasterVo)request.getSession().getAttribute("bbsMasterVo");
		bbsNttVo.setBbs_id(bbsMasterVo.getBbs_id());
		//기본적으로 필요하진 않은 구문 같다...생각해보자.
		modelMap.addAttribute("command", bbsNttVo);
	}
	
	@Override
	public void executeRead(HttpServletRequest request, ModelMap modelMap, Object command)throws Exception{
		BbsNttVo bbsNttVo = (BbsNttVo)command;
		//한화면에 여러 상세 조회 객체를 표현해야 할때가 있다. 폼 자동바인딩이나 벨리데이션 영향을 받지 않기 때문에 default  "프로그ID+Cmd" 로 설정해준다.
		modelMap.addAttribute("command", dao.selectByPk("bbsNttDao.read", bbsNttVo)); 
	}
	
	@Override
	public void executeUpdate(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		BbsNttVo bbsNttVo = (BbsNttVo)command;
		//1.코드ID 수정
		dao.update("bbsNttDao.update", bbsNttVo);
		
	}
	
	@Override
	public void executeUpdateForm(HttpServletRequest request,ModelMap modelMap, Object command)throws Exception {
		BbsNttVo bbsNttVo = (BbsNttVo)command;
		modelMap.addAttribute("command", dao.selectByPk("bbsNttDao.read", bbsNttVo));
	}
	
	
	@Override
	public void executeDelete(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		BbsNttVo bbsNttVo = (BbsNttVo)command;
		//1.게시판 설정 삭제
		dao.delete("bbsNttDao.delete", bbsNttVo);
	}
	
	
	@Override
	public void referenceData(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		
	}
	
}
