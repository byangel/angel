package customframework.com.app.atchFile;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


/**
 * @Class Name  : EgovFileMngUtil.java
 * @Description : 메시지 처리 관련 유틸리티
 * @Modification Information
 *
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.02.13       이삼섭                  최초 생성
 *   2011.08.09       서준식                  utl.fcc패키지와 Dependency제거를 위해 getTimeStamp()메서드 추가
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 02. 13
 * @version 1.0
 * @see
 *
 */
//@Component("atchFileUtil")
public class AtchFileUtil {

	private static final Logger LOG = Logger.getLogger(AtchFileUtil.class.getName());
	
    public static final int BUFF_SIZE = 2048;


    //@Resource(name = "egovFileIdGnrService")
    private EgovIdGnrService atchFileIdgenService;
    private EgovIdGnrService fileIdgenService;
    
    public void setAtchFileIdgenService(EgovIdGnrService atchFileIdgenService) {
		this.atchFileIdgenService = atchFileIdgenService;
	}

	public void setFileIdgenService(EgovIdGnrService fileIdgenService) {
		this.fileIdgenService = fileIdgenService;
	}

	

    /**
     * 첨부파일에 대한 목록 정보를 취득한다.
     *
     * @param files
     * @return
     * @throws Exception
     */
    public static List parseFileInf(MultipartHttpServletRequest multiRequest, String atchFileId, String storeFolder, String storePath) throws Exception {
    	////////
    	final Map files = multiRequest.getFileMap();
	
		String fileStorePath = "";
		
		//파일시스템 저장 경로 설정
		if ("".equals(storePath) || storePath == null) {
			fileStorePath = EgovProperties.getProperty("Globals.fileStorePath");
		} else {
			fileStorePath = EgovProperties.getProperty(storePath);
		}
		//파일시스템 저장 폴더
		if ("".equals(storeFolder) || storeFolder == null) {
			storeFolder = "COMMON";
		} 
		fileStorePath = fileStorePath + storeFolder.toUpperCase();
		
		
		//ID 채번
		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileId = atchFileIdgenService.getNextStringId();
		}
		
		
		File saveFolder = new File(EgovWebUtil.filePathBlackList(fileStorePath));
	
		if (!saveFolder.exists() || saveFolder.isFile()) {
		    saveFolder.mkdirs();
		}
	
		Iterator itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List atchFileVoList  = new ArrayList();
		AtchFileVo fvo;
	
		while (itr.hasNext()) {
			//Detail File ID 채번
			String nextFileId = fileIdgenService.getNextStringId();
			
		    Entry entry = (Entry) itr.next();
	
		    file = (MultipartFile)entry.getValue();
		    String orginFileName = file.getOriginalFilename();
		    long fileSize = file.getSize();
		    //--------------------------------------
		    // 원 파일명이 없는 경우 처리
		    // (첨부가 되지 않은 input file type)
		    //--------------------------------------
		    if ("".equals(orginFileName)) {
		    	continue;
		    }
		    ////------------------------------------
		    //파일 확장자
		    int index = orginFileName.lastIndexOf(".");
		    String fileExt = orginFileName.substring(index + 1);
		    //파일시스템 저장 이름 생성 
		    String newFileName = atchFileId  + "_" +  nextFileId + "_" + getTimeStamp();
		    
		    //파일 저장
		    if (!"".equals(orginFileName)) {
				filePath = fileStorePath + File.separator + newFileName;
				file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
		    }
		    fvo = new AtchFileVo();
		    fvo.setFile_extsn(fileExt);
		    fvo.setFile_stre_path(storeFolder);
		    fvo.setFile_mg(Long.toString(fileSize));
		    fvo.setFile_orignl_nm(orginFileName);
		    fvo.setFile_stre_nm(newFileName);
		    fvo.setAtch_file_id(atchFileId);
		    fvo.setFile_id(nextFileId);
	
		    //writeFile(file, newFileName, storeFolder);
		    atchFileVoList.add(fvo);
		}

		return atchFileVoList;
    }
    
    /**
     * 파일을 실제 물리적인 경로에 생성한다.
     *
     * @param file
     * @param newName
     * @param stordFilePath
     * @throws Exception
     */
    protected static void writeFile(MultipartFile file, String newName, String stordFilePath) throws Exception {
		InputStream stream = null;
		OutputStream bos = null;
	
		try {
		    stream = file.getInputStream();
		    File cFile = new File(EgovWebUtil.filePathBlackList(stordFilePath));
	
		    if (!cFile.isDirectory())
			cFile.mkdir();
	
		    bos = new FileOutputStream(EgovWebUtil.filePathBlackList(stordFilePath + File.separator + newName));
	
		    int bytesRead = 0;
		    byte[] buffer = new byte[BUFF_SIZE];
	
		    while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
			bos.write(buffer, 0, bytesRead);
		    }
		} catch (Exception e) {
		    //e.printStackTrace();
		    //throw new RuntimeException(e);	// 보안점검 후속조치
			Logger.getLogger(AtchFileUtil.class).debug("IGNORED: " + e.getMessage());
		} finally {
		    if (bos != null) {
			try {
			    bos.close();
			} catch (Exception ignore) {
			    Logger.getLogger(AtchFileUtil.class).debug("IGNORED: " + ignore.getMessage());
			}
		    }
		    if (stream != null) {
			try {
			    stream.close();
			} catch (Exception ignore) {
			    Logger.getLogger(AtchFileUtil.class).debug("IGNORED: " + ignore.getMessage());
			}
		    }
		}
    }
    
    
    /**
     * <pre>
     * Comment : 파일을 삭제한다.
     * </pre>
     *
     * @param fileDeletePath 삭제하고자 하는파일 VO
     * @return 성공하면 삭제된 파일의 절대경로, 아니면블랭크
     */
    public static String deleteFile(AtchFileVo fvo) throws Exception {
		
		String stordFolder = fvo.getFile_stre_path();
		String fileStordNm = fvo.getFile_stre_nm();
		String fileStorePath = EgovProperties.getProperty("Globals.fileStorePath");
		String fileDeletePath = fileStorePath + stordFolder + File.separator + fileStordNm;
		String result = EgovFileTool.deleteFile(fileDeletePath);
		return result;
    }
    public static void deleteFile(List atchFileVoList) throws Exception {
    	
		AtchFileVo fvo=null;
		String result=null; 
    	for(int i=0;i<atchFileVoList.size();i++){
    		fvo = (AtchFileVo)atchFileVoList.get(i);
    		result = deleteFile(fvo);
		}
    }

    

    /**
     * 서버 파일에 대하여 다운로드를 처리한다.
     *
     * @param response
     * @param streFileNm
     *            : 파일저장 경로가 포함된 형태
     * @param orignFileNm
     * @throws Exception
     */
    public static void downFile(HttpServletRequest request, HttpServletResponse response, String fileStreName, String fileOrignlName) throws Exception {
	
		File file = new File(fileStreName);
	
		if (!file.exists()) {
		    throw new FileNotFoundException(fileStreName);
		}
	
		if (!file.isFile()) {
		    throw new FileNotFoundException(fileStreName);
		}
	
		//byte[] b = new byte[BUFF_SIZE]; //buffer size 2K.
		int fSize = (int)file.length();
		if (fSize > 0) {
		    BufferedInputStream in = null;
	
		    try {
		    	//다운로드 파일명 셋팅
		    	String encodedFilename = null;
				String userAgent = request.getHeader("User-Agent");
				boolean ie = (userAgent.indexOf("MSIE") > -1) || (userAgent.indexOf("Trident") > -1);
				
				if(ie){
					encodedFilename = URLEncoder.encode(fileOrignlName, "UTF-8").replaceAll("\\+", "%20");
				}else{
					encodedFilename = new String(fileOrignlName.getBytes("UTF-8"),"iso-8859-1");
				}
				
				
		    	in = new BufferedInputStream(new FileInputStream(file));
	
	    	    response.setBufferSize(fSize);
				response.setContentType("application/x-msdownload");
				response.setHeader("Content-Disposition", "attachment; filename=\""+ encodedFilename +"\"");
				response.setContentLength(fSize);
				//response.setHeader("Content-Transfer-Encoding","binary");
				//response.setHeader("Pragma","no-cache");
				//response.setHeader("Expires","0");
				FileCopyUtils.copy(in, response.getOutputStream());
		    } finally {
			if (in != null) {
			    try {
				in.close();
			    } catch (Exception ignore) {
				
				Logger.getLogger(AtchFileUtil.class).debug("IGNORED: " + ignore.getMessage());
			    }
			}
		    }
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		}else {
    		response.setContentType("text/html");

    		PrintWriter printwriter = response.getWriter();
    		printwriter.println("<html>");
    		printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fileOrignlName + "</h2>");
    		printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
    		printwriter.println("<br><br><br>&copy; webAccess");
    		printwriter.println("</html>");
    		printwriter.flush();
    		printwriter.close();
    		
	    }
		
    }

    /**
     * 2011.08.09
     * 공통 컴포넌트 utl.fcc 패키지와 Dependency제거를 위해 내부 메서드로 추가 정의함
     * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
     *
     * @param
     * @return Timestamp 값
     * @exception MyException
     * @see
     */
    private static String getTimeStamp() {

		String rtnStr = null;
	
		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		//String pattern = "yyyyMMddhhmmssSSS";
		String pattern = "yyyyMMddhhmm";
		try {
		    SimpleDateFormat dateFormat = new SimpleDateFormat(pattern, Locale.KOREA);
		    Date date = new Date(System.currentTimeMillis());
	
		    rtnStr = dateFormat.format(date);
		} catch (Exception e) {
		    //e.printStackTrace();
			
		    //throw new RuntimeException(e);	// 보안점검 후속조치
		    LOG.debug("IGNORED: " + e.getMessage());
		}
	
		return rtnStr;
    }
}
