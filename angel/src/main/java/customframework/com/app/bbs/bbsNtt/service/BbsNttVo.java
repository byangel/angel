package customframework.com.app.bbs.bbsNtt.service;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import customframework.com.cmm.service.DefaultVo;


@Repository
@Scope(value="prototype")
public class BbsNttVo extends DefaultVo {
	private static final long serialVersionUID = 1L;
	
	@Length(max = 20, message="{errors.maxlength}")
	@NotNull(message="{errors.required}")
	private String bbs_id;
	private String ntt_id;
	private String parnts_ntt_id;
	private String answer_ordr;
	private String answer_level;
	@NotNull(message="{errors.required}")
	private String ntt_sj;
	@NotNull(message="{errors.required}")
	private String ntt_cn;
	private String rdcnt;
	private String use_at;
	private Date   regist_dt;
	private String register_id;
	private Date   updt_dt;
	private String updusr_id;
	private String atch_file_id;
	
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getNtt_id() {
		return ntt_id;
	}
	public void setNtt_id(String ntt_id) {
		this.ntt_id = ntt_id;
	}
	public String getParnts_ntt_id() {
		return parnts_ntt_id;
	}
	public void setParnts_ntt_id(String parnts_ntt_id) {
		this.parnts_ntt_id = parnts_ntt_id;
	}
	public String getAnswer_ordr() {
		return answer_ordr;
	}
	public void setAnswer_ordr(String answer_ordr) {
		this.answer_ordr = answer_ordr;
	}
	public String getAnswer_level() {
		return answer_level;
	}
	public void setAnswer_level(String answer_level) {
		this.answer_level = answer_level;
	}
	public String getNtt_sj() {
		return ntt_sj;
	}
	public void setNtt_sj(String ntt_sj) {
		this.ntt_sj = ntt_sj;
	}
	public String getNtt_cn() {
		return ntt_cn;
	}
	public void setNtt_cn(String ntt_cn) {
		this.ntt_cn = ntt_cn;
	}
	public String getRdcnt() {
		return rdcnt;
	}
	public void setRdcnt(String rdcnt) {
		this.rdcnt = rdcnt;
	}
	public String getUse_at() {
		return use_at;
	}
	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}
	
	public String getAtch_file_id() {
		return atch_file_id;
	}
	public void setAtch_file_id(String atch_file_id) {
		this.atch_file_id = atch_file_id;
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