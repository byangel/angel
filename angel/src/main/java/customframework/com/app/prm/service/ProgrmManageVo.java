package customframework.com.app.prm.service;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import customframework.com.cmm.service.DefaultVo;


@Component
@Scope(value="prototype")
public class ProgrmManageVo extends DefaultVo {
	
	@Length(min = 0, max = 20, message="{errors.maxlength}")
	private String progrm_id;	
	
	@NotEmpty(message="{errors.required}")
	@Length(min = 0, max = 50, message="{errors.maxlength}")
	private String progrm_nm;
	
	@NotEmpty(message="{errors.required}")
	@Length(min = 0, max = 100, message="{errors.maxlength}")
	private String progrm_stre_path;	
	
	
	@Length(min = 0, max = 250, message="{errors.maxlength}")
	private String progrm_dc;	
	
	@NotEmpty(message="{errors.required}")
	@Length(min = 0, max = 100, message="{errors.maxlength}")
	private String progrm_url;
	
	private String progrm_cn;

	@Length(min = 0, max = 15, message="{errors.maxlength}")
	private String progrm_ty;
	
	

	public String getProgrm_ty() {
		return progrm_ty;
	}

	public void setProgrm_ty(String progrm_ty) {
		this.progrm_ty = progrm_ty;
	}

	public String getProgrm_id() {
		return progrm_id;
	}

	public void setProgrm_id(String progrm_id) {
		this.progrm_id = progrm_id;
	}

	public String getProgrm_nm() {
		return progrm_nm;
	}

	public void setProgrm_nm(String progrm_nm) {
		this.progrm_nm = progrm_nm;
	}

	public String getProgrm_stre_path() {
		return progrm_stre_path;
	}

	public void setProgrm_stre_path(String progrm_stre_path) {
		this.progrm_stre_path = progrm_stre_path;
	}

	public String getProgrm_dc() {
		return progrm_dc;
	}

	public void setProgrm_dc(String progrm_dc) {
		this.progrm_dc = progrm_dc;
	}

	public String getProgrm_url() {
		return progrm_url;
	}

	public void setProgrm_url(String progrm_url) {
		this.progrm_url = progrm_url;
	}

	public String getProgrm_cn() {
		return progrm_cn;
	}

	public void setProgrm_cn(String progrm_cn) {
		this.progrm_cn = progrm_cn;
	}

	
}