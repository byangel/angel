/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	//커스텀 세팅
	config.docType = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
	config.font_defaultLabel = '굴림';
	config.font_names = '맑은 고딕;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana';
	config.fontSize_defaultLabel = '12px';
	config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;';
	config.language = "ko";
	config.resize_enabled = true;                   // 사이즈 변경
	config.enterMode = CKEDITOR.ENTER_BR;           // 에디터상에서 엔터입력시 <br />로 적용
	config.shiftEnterMode = CKEDITOR.ENTER_P;       // shift + enter 시 <p> 로 적용
	config.startupFocus = true;                     // 시작시 포커스 설정
	config.uiColor = '#EEEEEE';
	config.toolbarCanCollapse = false;              // 에디터 툴바 숨기기 기능 여부
	config.menu_subMenuDelay = 0;                   // 메뉴 클릭시 딜레이값
	config.toolbar = 'Full';
	//config.allowedContent = true;    // 기본적인 html이 필터링으로 지워지는데 이 부분을 써주면 필터링을 하지 않는다.
	config.autoUpdateElement = true, // 자동 textarea 업데이트 여부 (안됨)
	 

	config.toolbar_Full =
	[
		{ name: 'document', items : [ 'Source','-','Save','DocProps','Preview','Print','-'] },
		
		{ name: 'links', items : [ 'Link','Unlink'] },
		{ name: 'insert', items : [ 'Image','Table','SpecialChar','PageBreak'] },
		{ name: 'colors', items : [ 'TextColor','BGColor' ] },
		{ name: 'tools', items : [ 'Maximize'] },
		{ name: 'styles', items : [ 'Font','FontSize'] },
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','-','RemoveFormat' ] },
		{ name: 'paragraph', items : [ 'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
		
	];
	/*config.toolbar_Full =
		[
		 { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
		 { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		 { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
		 { name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton',  'HiddenField' ] },
		 '/',
		 { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
		 { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',  '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
		                                { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
		                                { name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },
		                                '/',
		                                { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
		                                { name: 'colors', items : [ 'TextColor','BGColor' ] },
		                                { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
		                                ];
 	*/
};
