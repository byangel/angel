package customframework.com.app.atchFile;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

import customframework.com.cmm.service.DefaultVo;

/**
 * @Class Name : FileVO.java
 * @Description : 파일정보 처리를 위한 VO 클래스
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 3. 25.     이삼섭
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 3. 25.
 * @version
 * @see
 *
 */
//@SuppressWarnings("serial")
public class AtchFileVo extends DefaultVo{

    /**
     * 첨부파일 아이디
     */
    public String atch_file_id = "";
    
    /**
     * 파일 아이디
     */
    public String file_id = "";
    /**
     * 파일저장경로
     */
    public String file_stre_path = "";
    /**
     * 원파일명
     */
    public String file_orignl_nm = "";
    /**
     * 저장파일명
     */
    public String file_stre_nm = "";
    /**
     * 파일확장자
     */
    public String file_extsn = "";
    /**
     * 파일크기
     */
    public String file_mg = "";
    
    /**
     * 파일내용
     */
    public String file_cn = "";
    
    private Date   regist_dt;
    private String register_id;

    //EXTENT
    /**
     * 사용 여부
     */
    public String use_at = "";
    

    public String getAtch_file_id() {
		return atch_file_id;
	}
	public void setAtch_file_id(String atch_file_id) {
		this.atch_file_id = atch_file_id;
	}
	public String getUse_at() {
		return use_at;
	}

	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}

	public String getFile_cn() {
		return file_cn;
	}

	public void setFile_cn(String file_cn) {
		this.file_cn = file_cn;
	}

	public String getFile_extsn() {
		return file_extsn;
	}

	public void setFile_extsn(String file_extsn) {
		this.file_extsn = file_extsn;
	}

	public String getFile_mg() {
		return file_mg;
	}

	public void setFile_mg(String file_mg) {
		this.file_mg = file_mg;
	}

	public String getFile_id() {
		return file_id;
	}

	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}

	public String getFile_stre_path() {
		return file_stre_path;
	}

	public void setFile_stre_path(String file_stre_path) {
		this.file_stre_path = file_stre_path;
	}

	public String getFile_orignl_nm() {
		return file_orignl_nm;
	}

	public void setFile_orignl_nm(String file_orignl_nm) {
		this.file_orignl_nm = file_orignl_nm;
	}


	public String getFile_stre_nm() {
		return file_stre_nm;
	}

	public void setFile_stre_nm(String file_stre_nm) {
		this.file_stre_nm = file_stre_nm;
	}

	
	
	public Date getRegist_dt() {
		return regist_dt;
	}
	public void setRegist_dt(Date regist_dt) {
		this.regist_dt = regist_dt;
	}
	public String getRegister_id() {
		return register_id;
	}
	public void setRegister_id(String register_id) {
		this.register_id = register_id;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
	
}
