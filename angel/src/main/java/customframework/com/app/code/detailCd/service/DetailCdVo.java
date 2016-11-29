package customframework.com.app.code.detailCd.service;

import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import customframework.com.cmm.service.DefaultVo;

@Repository
@Scope(value="prototype")
public class DetailCdVo extends DefaultVo{
    private static final long serialVersionUID = 1L;
    private String detail_cd_id;
    private String cd_id;
    private String detail_cd;
    private String detail_cd_nm;
    private String detail_cd_dc;
    private String use_at;
    private String upper_cd;
    private String detail_cd_eng_nm;
    private String detail_cd_ordr;
    
    private Date   regist_dt;
    private String register_id;
    private Date   updt_dt;
    private String updusr_id;
    
    private String cl_cd;
	
    
    //extends
    private List<DetailCdVo> detailCdVoList;
    private List<DetailCdVo> upDetailCdVoList; 
    
    private String changeAt; //리스트 페이지 에서 여러건을 수정할때 목록중 변경된것만 구분하고싶을때 사용한다. 
	
	
	public String getChangeAt() {
		return changeAt;
	}
	public void setChangeAt(String changeAt) {
		this.changeAt = changeAt;
	}
	public List<DetailCdVo> getDetailCdVoList() {
		return detailCdVoList;
	}
	public void setDetailCdVoList(List<DetailCdVo> detailCdVoList) {
		this.detailCdVoList = detailCdVoList;
	}
	public List<DetailCdVo> getUpDetailCdVoList() {
		return upDetailCdVoList;
	}
	public void setUpDetailCdVoList(List<DetailCdVo> upDetailCdVoList) {
		this.upDetailCdVoList = upDetailCdVoList;
	}
	public String getCl_cd() {
		return cl_cd;
	}
	public void setCl_cd(String cl_cd) {
		this.cl_cd = cl_cd;
	}
	
	
	public String getDetail_cd_id() {
		return detail_cd_id;
	}
	public void setDetail_cd_id(String detail_cd_id) {
		this.detail_cd_id = detail_cd_id;
	}
	public String getUpper_cd() {
		return upper_cd;
	}
	public void setUpper_cd(String upper_cd) {
		this.upper_cd = upper_cd;
	}
	public String getDetail_cd() {
		return detail_cd;
	}
	public void setDetail_cd(String detail_cd) {
		this.detail_cd = detail_cd;
	}
	public String getDetail_cd_nm() {
		return detail_cd_nm;
	}
	public void setDetail_cd_nm(String detail_cd_nm) {
		this.detail_cd_nm = detail_cd_nm;
	}
	public String getDetail_cd_dc() {
		return detail_cd_dc;
	}
	public void setDetail_cd_dc(String detail_cd_dc) {
		this.detail_cd_dc = detail_cd_dc;
	}
	public String getUse_at() {
		return use_at;
	}
	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}
	public String getCd_id() {
		return cd_id;
	}
	public void setCd_id(String cd_id) {
		this.cd_id = cd_id;
	}
	public String getDetail_cd_eng_nm() {
		return detail_cd_eng_nm;
	}
	public void setDetail_cd_eng_nm(String detail_cd_eng_nm) {
		this.detail_cd_eng_nm = detail_cd_eng_nm;
	}
	public String getDetail_cd_ordr() {
		return detail_cd_ordr;
	}
	public void setDetail_cd_ordr(String detail_cd_ordr) {
		this.detail_cd_ordr = detail_cd_ordr;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
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
