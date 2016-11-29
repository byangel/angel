package customframework.com.app.code.clCd.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import customframework.com.app.code.clCd.service.ClCdVo;
import customframework.com.app.code.cmmnCd.service.CmmnCdVo;
import customframework.com.app.code.detailCd.service.DetailCdVo;
import customframework.com.cmm.init.saa.AttrSetterOfApplicationScop;
import customframework.com.cmm.service.impl.ServiceSupport;

@Service
public class ClCdServiceImpl extends ServiceSupport {

	@Resource(name="codeInitService")
	public AttrSetterOfApplicationScop codeInitService;
	
	@Override
	public void executeDelete(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception{
		ClCdVo clCdVo = (ClCdVo)command;
		String cl_cd = clCdVo.getCl_cd();
		
		//1.자식테이블 즉 코드ID 와 상세코드 정보를 삭제 후 분류코드를 삭제한다.
		DetailCdVo detailCdVo = new DetailCdVo();
		dao.delete("detailCdDao.delete", detailCdVo);//상세코드 삭제
		
		CmmnCdVo cmmnCdVo = new CmmnCdVo();
		cmmnCdVo.setCl_cd(cl_cd);
		dao.delete("cmmnCdDao.delete", cmmnCdVo);//코드ID 삭제
		
		//2.코드ID 삭제
		dao.delete("clCdDao.delete", clCdVo);
		
		//3.어플리케이션 영역에 저장된 코드데이타 업데이트 한다.
		this.codeInitService.excute();
		
	}
}
