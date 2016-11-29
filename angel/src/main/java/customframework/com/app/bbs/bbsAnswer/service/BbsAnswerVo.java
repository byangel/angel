package customframework.com.app.bbs.bbsAnswer.service;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import customframework.com.cmm.service.DefaultVo;


@Repository
@Scope(value="prototype")
public class BbsAnswerVo extends DefaultVo {
	@NotNull(message="{errors.required}")
	private String bbs_id;
	@NotNull(message="{errors.required}")
	private String ntt_id;
	@NotNull(message="{errors.required}")
	private String answer_id;
	@NotNull(message="{errors.required}")
	private String answer_cn;
	private Date   regist_dt;
	private String register_id;
	private Date   updt_dt;
	private String updusr_id;
	
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
	public String getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(String answer_id) {
		this.answer_id = answer_id;
	}
	public String getAnswer_cn() {
		return answer_cn;
	}
	public void setAnswer_cn(String answer_cn) {
		this.answer_cn = answer_cn;
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