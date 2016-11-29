package customframework.com.app.code.cmmnCd.service;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import customframework.com.cmm.service.DefaultVo;

/**
 * @Class Name : ComtDetailCdVO.java
 * @Description : ComtDetailCd VO class
 * @Modification Information
 *
 * @author neloi
 * @since 2015-03-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
@Repository
@Scope(value="prototype")
public class CmmnCdVo extends DefaultVo{
	private static final long serialVersionUID = 1L;

    private String cl_cd;
    private String cd_id;
    private String cd_id_nm;
    private String cd_id_dc;
    private Date   regist_dt;
    private String register_id;
    private Date   updt_dt;
    private String updusr_id;
	
    public String getCl_cd() {
		return cl_cd;
	}
	public void setCl_cd(String cl_cd) {
		this.cl_cd = cl_cd;
	}
	public String getCd_id() {
		return cd_id;
	}
	public void setCd_id(String cd_id) {
		this.cd_id = cd_id;
	}
	public String getCd_id_nm() {
		return cd_id_nm;
	}
	public void setCd_id_nm(String cd_id_nm) {
		this.cd_id_nm = cd_id_nm;
	}
	public String getCd_id_dc() {
		return cd_id_dc;
	}
	public void setCd_id_dc(String cd_id_dc) {
		this.cd_id_dc = cd_id_dc;
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
	public Date getUpdt_dt() {
		return updt_dt;
	}
	public void setUpdt_dt(Date updt_dt) {
		this.updt_dt = updt_dt;
	}
	public String getUpdusr_id() {
		return updusr_id;
	}
	public void setUpdusr_id(String updusr_id) {
		this.updusr_id = updusr_id;
	}
	
    
   
}
