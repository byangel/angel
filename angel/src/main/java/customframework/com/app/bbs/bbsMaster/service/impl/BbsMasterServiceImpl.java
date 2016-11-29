package customframework.com.app.bbs.bbsMaster.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import customframework.com.app.bbs.bbsMaster.service.BbsMasterVo;
import customframework.com.cmm.service.impl.ServiceSupport;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service
public class BbsMasterServiceImpl extends ServiceSupport {

	@Override
	public void executeDelete(HttpServletRequest request,ModelMap modelMap,Object command)throws Exception {
		String progrmNm = (String)request.getAttribute("progrmNm");
		dao.delete(progrmNm + "Dao.delete", command);
		
		//1.뎃글 삭제
		//2.첨부파일 삭제
		//3.게시물 삭제..
		//4.bbsMaster 정보삭제
	}
	
	
}
