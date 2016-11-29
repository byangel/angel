package customframework.com.cmm.service;

import java.io.Serializable;


public class DefaultVo implements Serializable {
	 private static final long serialVersionUID = 1L;
	/** 검색조건 */
    private String searchCondition = "";
    
    /** 검색Keyword */
    private String searchKeyword = "";
    
    /** 검색사용여부 */
    private String searchUseYn = "";
    
    /** 현재페이지 */
    private int pageIndex = 1;
    
    /** 페이지갯수 */
    private int pageUnit = 10;
    
    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex 2015-03-13 변경함.*/
    private int firstIndex = 0;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;
    
	
	/** 아이디젠  */
    private String itemId; 
    
    
    /** 레이아웃 이름   modelMap 에저장하여 했으나 redirect 할때 파람값으로 넘어가는 문제 때문에 vo에 저장한다.*/
    private String layoutNm;
    private String progrmNm;
    private String viewNm;

    
    public String getLayoutNm() {
		return layoutNm;
	}

	public void setLayoutNm(String layoutNm) {
		this.layoutNm = layoutNm;
	}

	public String getProgrmNm() {
		return progrmNm;
	}

	public void setProgrmNm(String progrmNm) {
		this.progrmNm = progrmNm;
	}

	public String getViewNm() {
		return viewNm;
	}

	public void setViewNm(String viewNm) {
		this.viewNm = viewNm;
	}

	/**로그인 사용자 아이디 */
    private String loginId;  
    
    /**로그인 사용자 명 */
    private String loginNm;  
    
    /**로그인 IP */
    private String loginIp;
    
    /**정렬 필드 */
    private String sortField; 
    
    /**정렬 타입 */
    private String orderType;  
    
    
    private String atch_file_id;
    private String atch_image_id;
    
    
	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getAtch_file_id() {
		return atch_file_id;
	}

	public void setAtch_file_id(String atch_file_id) {
		this.atch_file_id = atch_file_id;
	}

	public String getAtch_image_id() {
		return atch_image_id;
	}

	public void setAtch_image_id(String atch_image_id) {
		this.atch_image_id = atch_image_id;
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}


	public String getLoginNm() {
		return loginNm;
	}

	public void setLoginNm(String loginNm) {
		this.loginNm = loginNm;
	}



    
}
