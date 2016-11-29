package customframework.com.app.bbs.bbsMaster.service;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import customframework.com.cmm.service.DefaultVo;


@Repository
@Scope(value="prototype")
public class BbsMasterVo extends DefaultVo {
	private static final long serialVersionUID = 1L;
	
	@Length(min = 0, max = 20, message="{errors.maxlength}")
	@NotNull(message="{errors.required}")
	private String bbs_nm;
	
	@NotNull(message="{errors.required}")
	private String bbs_id;
	
	@Length(max = 256, message="{errors.maxlength}")
	private String bbs_dc;
	
	//@Length(min = 1,max = 1, message="{errors.maxlength}")
	//@NotNull(message="{errors.required}")
	private String answer_use_at; //뎃글 사용 여부
	
	@Length(max = 15, message="{errors.maxlength}")
	@NotNull(message="{errors.required}")
	private String bbs_ty_cd; //게시판 구분
	
	//@Length(min = 1,max = 1, message="{errors.maxlength}")
	//@NotNull(message="{errors.required}")
	private String reply_use_at; //답글 사용 여부
	
	
	private String file_atch_posbl_number;//첨부가능 수
	private String file_atch_posbl_size;//첨부가능 크기
	private Date   regist_dt;
    private String register_id;
    private Date   updt_dt;
    private String updusr_id;
	public String getBbs_nm() {
		return bbs_nm;
	}
	public void setBbs_nm(String bbs_nm) {
		this.bbs_nm = bbs_nm;
	}
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getBbs_dc() {
		return bbs_dc;
	}
	public void setBbs_dc(String bbs_dc) {
		this.bbs_dc = bbs_dc;
	}
	public String getAnswer_use_at() {
		return answer_use_at;
	}
	public void setAnswer_use_at(String answer_use_at) {
		this.answer_use_at = answer_use_at;
	}
	public String getBbs_ty_cd() {
		return bbs_ty_cd;
	}
	public void setBbs_ty_cd(String bbs_ty_cd) {
		this.bbs_ty_cd = bbs_ty_cd;
	}
	public String getReply_use_at() {
		return reply_use_at;
	}
	public void setReply_use_at(String reply_use_at) {
		this.reply_use_at = reply_use_at;
	}
	
	
	public String getFile_atch_posbl_number() {
		return file_atch_posbl_number;
	}
	public void setFile_atch_posbl_number(String file_atch_posbl_number) {
		this.file_atch_posbl_number = file_atch_posbl_number;
	}
	public String getFile_atch_posbl_size() {
		return file_atch_posbl_size;
	}
	public void setFile_atch_posbl_size(String file_atch_posbl_size) {
		this.file_atch_posbl_size = file_atch_posbl_size;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}