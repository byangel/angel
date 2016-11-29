

		/* 
	 * 
	 * 같은 값이 있는 열을 병합함
	 * 
	 * 사용법 : $('#테이블 ID').rowspan(0);
	 * 
	 */  
	(function($){
	
		$.fn.rowspan = function(colIdx, isStats) {       
		    return this.each(function(){      
		        var that;     
		        $('tr', this).each(function(row) {      
		            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
		                 
		                if ($(this).html() == $(that).html()
		                    && (!isStats 
		                            || isStats && $(this).prev().html() == $(that).prev().html()
		                            )
		                    ) {            
		                    rowspan = $(that).attr("rowspan") || 1;
		                    rowspan = Number(rowspan)+1;
		 
		                    $(that).attr("rowspan",rowspan);
		                     
		                    // do your action for the colspan cell here            
		                    $(this).hide();
		                     
		                    //$(this).remove(); 
		                    // do your action for the old cell here
		                     
		                } else {            
		                    that = this;         
		                }          
		                 
		                // set the that if not already set
		                that = (that == null) ? this : that;      
		            });     
		        });    
		    });  
		}; 
		
		$.fn.unRowspan = function(colIdx, isStats) {       
		    return this.each(function(){      
		        $('tr', this).each(function(row) {      
		            $('td:eq('+colIdx+')', this).each(function(col) {
		            	$(this).removeAttr("rowspan");
	                    $(this).show();
		            });     
		        });    
		    });  
		}; 
		 
		 
		/* 
		 * 
		 * 같은 값이 있는 행을 병합함
		 * 
		 * 사용법 : $('#테이블 ID').colspan (0);
		 * 
		 */  
		$.fn.colspan = function(rowIdx) {
		    return this.each(function(){
		         
		        var that;
		        $('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
		            $(this).find('th').filter(':visible').each(function(col) {
		                if ($(this).html() == $(that).html()) {
		                    colspan = $(that).attr("colSpan") || 1;
		                    colspan = Number(colspan)+1;
		                     
		                    $(that).attr("colSpan",colspan);
		                    $(this).hide(); // .remove();
		                } else {
		                    that = this;
		                }
		                 
		                // set the that if not already set
		                that = (that == null) ? this : that;
		                 
		            });
		        });
		    });
		}
	})(jQuery);


	//플러그인 iFrame auto Height
	(function($){
		$.fn.iframeAutoHeight = function(){
			var height = $(this).contents().find('html')[0].scrollHeight;
			$(this).attr("height",height);
		};
	})(jQuery);


	//날자 기간 플러그인
	(function($){
		
		
		//date
		$.fn.date = function(option){
			//input 싸이즈 지정
			$(this).attr("size","11");
			
			option = $.extend({},datePickerOption, option);
			$(this).datepicker(option);
		};
		
		
		//dateTime
		$.fn.dateTime = function(option){
			//input 싸이즈 지정
			$(this).attr("size","19");
			
			option = $.extend({},dateTimePickerOption, option);
			$(this).datetimepicker(option);
		};
		
		//time
		$.fn.time = function(option){
			option = $.extend({},dateTimePickerOption, option);
			$(this).timepicker(option);
		};
		
		//datePeriod
		$.fn.datePeriod = function(option){
			var inputs = $(this).find("input");
			var startTarget = $(inputs[0]);
			var endTarget = $(inputs[1]);
			
			//input 싸이즈 지정
			$(startTarget).attr("size","11");
			$(endTarget).attr("size","11");
		
			var startOption = $.extend({},datePickerOption, option);
			var endOption = $.extend({},datePickerOption, option);
			
			startOption.onSelect = function (selectedDate){
				var startDate = $(startTarget).datepicker('getDate');
				var endDate = $(endTarget).datepicker('getDate');
				if (startDate > endDate){//end 보다 클수 없다.
					$(endTarget).datepicker('setDate', startDate);
				}
				if (endDate == null){
					$(endTarget).datepicker('setDate', startDate);
				}
				$(endTarget).datepicker('option', 'minDate', $(startTarget).datepicker('getDate') );
			};
			endOption.onSelect = function (selectedDate){
				var startDate = $(startTarget).datepicker('getDate');
				var endDate = $(endTarget).datepicker('getDate');
				if (startDate > endDate){//end 보다 클수 없다.
					
					$(startTarget).datepicker('setDate', endDate);
				}
				if (startDate == null){
					$(startTarget).datepicker('setDate', endDate);
				}
				$(startTarget).datepicker('option', 'maxDate', $(endTarget).datepicker('getDate') );
			};
			$(startTarget).datepicker(startOption);
			$(endTarget).datepicker(endOption);
		};
		
		//dateTimePeriod
		$.fn.dateTimePeriod = function(option){
			var inputs = $(this).find("input");
			var startTarget = $(inputs[0]);
			var endTarget = $(inputs[1]);
			
			//input 싸이즈 지정
			$(startTarget).attr("size","19");
			$(endTarget).attr("size","19");
			
			option = $.extend({},dateTimePickerOption, option);
			var startOption = $.extend({},dateTimePickerOption, option);
			var endOption = $.extend({},dateTimePickerOption, option);
			
			startOption.onClose = function (dateText, inst){
				if (endTarget.val() != '') {
					var startDate = endTarget.datetimepicker('getDate');
					var endDate = endTarget.datetimepicker('getDate');
					if (startDate > endDate)//시작일자가 크면
						endTarget.datetimepicker('setDate', startDate);
				}
				else {
					endTarget.val(dateText);
				}
			};
			startOption.onSelect = function (selectedDateTime){
				endTarget.datetimepicker('option', 'minDate', startTarget.datetimepicker('getDate') );
			};
			
			endOption.onClose = function (dateText, inst){
				if (startTarget.val() != '') {
					var startDate = endTarget.datetimepicker('getDate');
					var endDate = endTarget.datetimepicker('getDate');
					if (startDate > endDate)//시작일자가 크면
						startTarget.datetimepicker('setDate', endDate);
				}
				else {
					startTarget.val(dateText);
				}
			};
			endOption.onSelect = function (selectedDateTime){
				startTarget.datetimepicker('option', 'maxDate', endTarget.datetimepicker('getDate') );
			};
			
			startTarget.datetimepicker(startOption);
			endTarget.datetimepicker(endOption);
		};
		
		//timePeriod
		$.fn.timePeriod = function(option){
			var inputs = $(this).find("input");
			var startTarget = $(inputs[0]);
			var endTarget = $(inputs[1]);
			
			//input 싸이즈 지정
			$(startTarget).attr("size","5");
			$(endTarget).attr("size","5");
			
			
			var startOption = $.extend({},dateTimePickerOption, option);
			var endOption = $.extend({},dateTimePickerOption, option);
			
			
			$.timepicker.timeRange(
					startTarget,
					endTarget,
					{
						minInterval: (1000*60*60), // 1hr
						start: startOption, // start picker options
						end: endOption // end picker options
					}
				);
		};
	})(jQuery);
	

	
	
	//첨부파일 플러그인(ajaxForm 플러그인을 확장 한다.)
	(function($){
		'use strict';	
		$.fn.fileUpLoad = function(o){
			
			var $options = {  
					
				 maxNumberOfFiles: 5
				,maxFileSize: undefined
	            ,minFileSize:undefined
	            ,maxChunkSize: 100000000
	            ,autoUpload:true
	            
	            ,thisObj:undefined
	            ,thisObjValue:undefined
	            ,thisObjName:'atch_file_id'
	            	
	            ,createUrl:'/atchFileCreate.do'
	            ,deleteUrl:'/atchFileDelete.do'
	            ,listUrl:'/atchFileList.do'
	            ,readUrl:'/atchFileRead.do'
	            ,getNextIdUrl:'/atchFileNextId.do'
	            
	            ,atchFileId: undefined
	            ,imageExt:['gif','png','jsp','jpeg']
				,uploadType:undefined
			    ,includeExt:undefined
			    ,excludeExt:['exe']
	            //Util
	            ,_getNumberOfFiles: function () {
                    //return this.filesContainer.find(".template-download,.template-upload").length;
                    //template-upload
	            	
                    return this.filesContainer.children().not('.valid-error').length;
                }
				,_formatFileSize: function (bytes) {
		            if (typeof bytes !== 'number') {
		                return '0';
		            }
		            if (bytes >= 1000000000) {
		                return (bytes / 1000000000).toFixed(2) + ' GB';
		            }
		            if (bytes >= 1000000) {
		                return (bytes / 1000000).toFixed(2) + ' MB';
		            }
		            return (bytes / 1000).toFixed(2) + ' KB';
		        }
	            //validation
	            ,messages: {
	                 maxNumberOfFiles: 'Maximum number of files exceeded'
	                ,acceptFileTypes: 'File type not allowed'
	                ,maxFileSize: 'File is too large'
	                ,uploadedBytes: 'Uploaded bytes exceed file size'
	                ,minFileSize: 'File is too small'
	            }
	            ,validation: function (file, option) {
	            	var that = this;
	            	var fileSize = file.size || file.file_mg;
	            	var fileName = file.name || file.file_orignl_nm;
	            	var ext = fileName.split('.').pop().toLowerCase() ||fileName.split('.').pop().toLowerCase();
	            	
	            	if(option.maxNumberOfFiles){//초대 업로드 수 체크
	            		if(option._getNumberOfFiles() > option.maxNumberOfFiles){
		            		file.error = this.messages.maxNumberOfFiles;
		            		return false;
		            	}
	            	}
	            	
	            	if(option.maxFileSize){//최대업로드 싸이즈 체크
	            		if(fileSize > option.maxFileSize){
		            		file.error = option.messages.maxFileSize;
		            		return false;
		            	}
	            	}
	            	
	            	if(option.minFileSize){//최소 업로드 싸이즈 체크
	            		if(fileSize < option.minFileSize){
		            		file.error = option.messages.minFileSize;
		            		return false;
		            	}
	            	}
	            	
	            
	            	if(option.maxChunkSize){//토탈 업로드 싸이즈 체크
	            		if(option._getUploadBytes() > option.maxChunkSize){
		            		file.error = that.messages.uploadedBytes;
		            		return false;
		            	}
	            	}
	            	
	            	if(option.includeExt){//설정된 확장자만 업로드 가능
	            		 if($.inArray(ext, option.includeExt) == -1) {
	            			 file.error = option.messages.acceptFileTypes;
	            			 return false;
	            		 }
	            	}
	            	
	            	if($.inArray(ext, option.excludeExt)== 0) {//확장자 제한
	            		file.error = option.messages.acceptFileTypes;
           			 	return false;
           		 	}
	            	return true;
	            }
	            
	            //Action
	    		,send : function(form,uploadTemplate){
	    			var that = this;
	    			var options = {  
						dataType:'json'
				       ,beforeSubmit:function (formData, jqForm, options) {
				    	   //alert("전송전!!");
						}
			           ,success: function(responseText, statusText, xhr, $form){
			        	  
			        	   	form.remove(); //파일전송 완료시  폼 엘리먼트 삭제
			        	   	uploadTemplate.fadeOut(1000,function(){ 
				        	   								$(this).remove();
				        	   								var files = eval(responseText);
				        	   			   					that.onAdd(files);
			        	   								});//파일전송 완료시 업로드 템플릿 삭제.
			           	}
			           ,uploadProgress: function(event, position, total, percentComplete) {             

			        	    var bar = uploadTemplate.find(".progress-bar");            
			        	   	var percent = uploadTemplate.find(".progress-bar");
			        	  
			        	   	var percentVal = percentComplete + '%';             
			        	   	bar.css('width', percentVal  );
			        	   	percent.html(percentVal);  
			        	  
			        	} 
			           ,error: function(xhr){
			        	    var status = $('#status');
			        		status.html(xhr.responseText); 
						    alert(xhr.statusCode+"에러발생 하였습니다. 시스템관리자에게 문의 바랍니다.");
						}
			           ,complete: function(xhr) {
			        	   	//alert("컴플릿");
			        	 }
	    			}; 
	    			form.ajaxSubmit(options);
	    		}
	    		,_atchFileDelete : function(file, template){
	    			var that = this;
	    			//Server File Item Delete.
	    			var targetUrl=this.deleteUrl;
	    			var atch_file_id = file.atch_file_id;
	    			var file_id = file.file_id;
	    			var register_id = file.register_id;
	    			var fn_success;
	    			var data = {};
	    			
	    			if(atch_file_id){
	    				data.atch_file_id = atch_file_id;
	    			}
	    			if(file_id){
	    				data.file_id = file_id;
	    			}
	    			if(register_id){
	    				data.register_id = register_id;
	    			}
	    			if(template){
	    				var sub = confirm("삭제 하시겠습니까?");
						if(!sub){ 
							return false;
						}
						fn_success = function(responseText){
		    				//File Template Delete.
							template.fadeOut(500,function(){
													template.remove();
													that._renderState();//벨리데이션 상태값 변경
													alert("삭제 완료");
												 });
		    			};
	    			}else{
	    				fn_success = function(responseText){
	    					that._renderState();//벨리데이션 상태값 변경
		    			};
	    			}
	    			
	    			$.ajax({
	    				 type		:'GET'
	    				,url 		: targetUrl
	    				,data     	: data
	    				,dataType 	: 'json'
	    				,success  	: fn_success
	    				,error	  : function(r){
	    								alert("파일 삭제중 에러발생 하였습니다. 시스템관리자에게 문의 바랍니다.");
	    				 			}
	    			});
	    		}
	    		,_atchFileList : function(o){
	    			//Download File List.
	    			var that = this;
	    			var targetUrl=this.listUrl;
	    			var atchFileID = this.thisObj.attr('value');
	    			var data = {'atch_file_id':atchFileID};
	    			
	    			$.ajax({
	    					 type		:'GET'
	    					,url 		: targetUrl
	    					,data     	: data
	    					,dataType 	: 'json'
	    					,success  	: function(responseText){
	    						var files = eval(responseText);
	    							that.onAdd(files);
	    					}
	    					,error	  : function(r){
	    						result = false;
	    						alert("파일 목록 에러발생 하였습니다. 시스템관리자에게 문의 바랍니다.");
	    					}
	    			});
	    		}
	    		,_nextAtchFileId : function(o){
	    			var that = this;
	    			var targetUrl=this.getNextIdUrl;
	    			var data = {};
	    			$.ajax({
	    					type		:'GET'
	    					,url 		: targetUrl
	    					,data     	: data
			    			,dataType 	: 'json'
			    			,success  	: function(responseText){
			    					var obj = eval(responseText);
			    					$(that.thisObj).val(obj.atch_file_id);
			    			}
			    			,error	  : function(r){
			    				alert("next id 에러발생 하였습니다. 시스템관리자에게 문의 바랍니다.");
			    			}
			    	});
	    		}
	    		//UI
				,rootElement:$("<div></div>").attr({'class':'panel panel-default rootElement'})
				,buttonBarElement:$("<div></div>").attr({'class':'panel-heading fileupload-buttonbar'})
				,filesContainer:$("<div></div>").attr({'class':'panel-body files'})
				,stateElement:$("<div></div>").attr({'class':'panel-footer state'})
				,downloadTemplate:function(o){
					var  result = ""
						,formatFileSize = o.formatFileSize
						,file = o.file
						,name = file.name || file.file_orignl_nm
						,size = file.size || file.file_mg;
					
						result +="<div class='template-download'>";
						result += "	 <a href=''  class='btn btn-link btn-xs' >";
						result += "	 	<i class='glyphicon glyphicon-save' type='button'>";
						result += 	 		name + " ("+formatFileSize(Number(size))+")";
						result += "	 	</i>";
						result += "	 </a><span class='size' style='display:none'>"+size+"</span>";
						result += "	 <button class='btn btn-link btn-xs delete' type='button'>";
						result += "		<i class='glyphicon glyphicon-remove' type='button'>삭제</i>";
						result += "	 </button>";
						result +="</div>";	
					
					return $(result);
				}
				,uploadTemplate:function(o){
					
					var  result = ""
						,formatFileSize = o.formatFileSize
						,name = o.file.name
						,size = o.file.size || 0;
						
						result +="<div class='template-upload'>";
						result +="	<span class='file-name'>"+ name ;
						if(size){
							result +="("+formatFileSize(Number(size))+")"; 
						} 
						result +="	</span><span class='size' style='display:none'>"+size+"</span>";
						result += " <button class='btn btn-link btn-xs start'  type='button'>Start</button>";
						result += " <button class='btn btn-link btn-xs cancel' type='button'>cancel</button>";
						result += "	<div class='progress progress-striped active' style='width:30%;'> " ;
						result += "		<div class='progress-bar progress-bar-success' style='width:0%;'></div>" ;
						result += "	</div>";
						
						result +="</div>";	
					//});
					 
					return $(result);
				}
			
				,formTemplate:function(data){
	   	    		var $form = $("<form/>").attr({'method':'POST', 'enctype':'multipart/form-data', 'action':this.createUrl});
	   	    		$("<input/>").attr({'type':"text", 'name':this.thisObjName, 'value':$.trim(this.thisObj.val())}).appendTo($form);
	   	    		$(data.fileInput).appendTo($form);
			   		return $form;
	            }
				,_renderUpload: function (file) {
		            return this._renderTemplate( this.uploadTemplate, file );
		        }
				,_getUploadBytes:function(){
					var uploadBytes = 0;
					this.filesContainer.find(".size").each(function (index, el) {
						if(!$(el).closest('.template-upload,.template-download').hasClass('valid-error')){
							uploadBytes =Number(uploadBytes)+ Number($(el).text());
						}
		 			});
					return uploadBytes;
				}
				,_renderState: function () {
					var result = "<small class='.blockquote-reverse'>";
					var uploadedBytes = this._getUploadBytes();
					
					if(this.maxFileSize){
						result +="Files("+this._formatFileSize(this.maxFileSize)+"):"+this._getNumberOfFiles()+"";
					}else{
						result +="Files:"+this._getNumberOfFiles()+"";;
					}
			        if(this.maxNumberOfFiles){
			        	result +=" / "+this.maxNumberOfFiles+"&nbsp;&nbsp;&nbsp;";
			        }else{
			        	result +="&nbsp;&nbsp;&nbsp;";
			        }  
			        if(this.maxChunkSize){
			        	result +="TotalSize : " + this._formatFileSize(uploadedBytes) + " / "+this._formatFileSize(this.maxChunkSize);
			        }else{
			        	result +="TotalSize : " + this._formatFileSize(uploadedBytes);
			        }
			        result += "</small>"; 
					this.stateElement.html(result);
				}

		        ,_renderDownload: function (file) {
		            return this._renderTemplate( this.downloadTemplate, file );
		        }
				,_renderTemplate: function (func, file) {
		            if (!func) {
		                return $();
		            }
	            	//var result = func({ file: file, options: this });
		            var result = func({  'file':file
		            					,'formatFileSize':this._formatFileSize
		            					,'autoUpload':this.autoUpload
		            				  });
	            	$(result).prependTo(this.filesContainer);
		            return result;
		        }
				
				,init : function(thisObj){
					this.thisObj = $(thisObj);
					this.thisObj.hide();
					
					var that = this;
					this.buttonBarElement.appendTo(this.rootElement);
					this.filesContainer.appendTo(this.rootElement);
					
					var result="";
					result += "		<input type='file', name=inputFiles[] id='inputFiles' style='display:none' />";
					result += "		<label class = 'btn btn-link btn-xs fileSelectButton' type='button' for='inputFiles'>";
					result += "			<i class = 'glyphicon glyphicon-plus' />Select files...";
					result += "		</label>";
					if(!this.autoUpload){
					result += "		<button class = 'btn btn-link btn-xs start-all' type='button'>";
					result += "			<i class = 'glyphicon glyphicon-plus' />Start Upload";
					result += "		</button>";
					}
			        
					//버튼 생성
					$(result).appendTo(this.buttonBarElement);
					//state
					this.stateElement.appendTo(this.rootElement);
					
					//file manager area create after this object
					this.rootElement.insertAfter(this.thisObj);
					
					//파일선택 이벤트 설정
					this.buttonBarElement.find("#inputFiles").change(function(e){
						that._onChange(e);
					});
					//전체 업로드 버튼 이벤트 설정
					this.buttonBarElement.find(".start-all").click(function(e){
						that.filesContainer.find('.start').trigger('click');
					});
					
					
					//첨부파일 아이디(마스터 아이디)값 여부 판단한다. 
					this.thisObjValue=$(thisObj).val();
					if(this.thisObjValue){//첨부파일 아이디 가 존재 하면 첨부파일 리스트를 구한다.
						//Get Atch File list.
						this._atchFileList();
					}else{//첨부파일 아이디가 없다면, 첨부파일 아이디를 생성하고 첨부파일 인풋박스에 값을 주입 시킨다.
						this._nextAtchFileId();
					}
					
					
					//validation
					if(this.uploadType == 'image'){
						this.includeExt = this.imageExt;
					}
					
					if(this.maxNumberOfFiles){//업로드 파일수 제한 옵션 값이 있다면.
						if(this.maxFileSize){//파일 사이즈 제한이 있다면.
							this.maxChunkSize = this.maxFileSize * this.maxNumberOfFiles;
						}
					}
					
				}
	            ,_getTotal: function (files) {
					            var total = 0;
					            $.each(files, function (index, file) {
					                total += file.size || 1;
					            });
					            return total;
		        			}
	            ,_createForm:function(fileInput){//, 'style':'display:none'
	   	    		var $form = $("<form/>").attr({'method':'POST', 'enctype':'multipart/form-data', 'action':this.createUrl, 'style':'display:none'});
	   	    		$("<input/>").attr({'type':"text", 'name':this.thisObjName, 'value':$.trim(this.thisObj.val())}).appendTo($form);
	   	    		$(document.body).append($form);//폼생성
			   		return $form;
	            }
	            ,add:function(form,files){
	            	var that = this;
	            	$.each(files, function (index, file) {
    					var uploadTemplate = that._renderUpload(file); //업로드 템플릿 생성.
    					var valid = that.validation(file,that);//벨리데이션 체크
    					var error = file.error;
    					
    					//upload event setting.
    					if(valid){
    						if(that.autoUpload){
    							that.send(form, uploadTemplate);
    						}
    						uploadTemplate.find(".start").click(function(){ //클릭 이벤트 생성.
		    					that.send(form, uploadTemplate);
		    				});
    						
    					}else{//error
    						uploadTemplate.addClass('valid-error');
    						uploadTemplate.find('.progress').remove();
    						uploadTemplate.find(".start").after("<span class='label label-danger'>"+error+"</span>").remove();//start button 대신 error message출력.
    					}
    					
    					uploadTemplate.find(".cancel").click(function(){ //cencle 클릭 이벤트 생성.
    						uploadTemplate.fadeOut(500,function(){
    														uploadTemplate.remove();
    														that._renderState();
    														form.remove();//form delete.
    													});//template delete.
    					});
    					
		            });
	            	this._renderState();
	            }
	            ,onAdd:function(files){
	            	var that = this;
	        	 
   					//file Info Display.
   					$.each(files, function (index, file) {
   						
    					var downloadTemplate = that._renderDownload(file);//다운로드 템플릿 생성
    					var valid = that.validation(file,that);//벨리데이션 체크
    					var error = file.error;
    					
    					var fileId = file.file_id;
    					var url = that.readUrl+"?file_id="+fileId;
    					//upload event setting.
    					if(valid){
    						//delete event setting.
    						downloadTemplate.find('.delete').click(function (){
    							that._atchFileDelete(file, downloadTemplate);//파일 삭제 완료시 downLoadTemplate 해당 삭제
    						});
    						downloadTemplate.find('a').click(function (){
    							$(this).attr("href",url);
    							return true;
    						});
    						
    					}else{
    						//에러면 파일 삭제 한다.
    						that._atchFileDelete(file);
    						
    						downloadTemplate.addClass('valid-error');
    						downloadTemplate.find(".delete").after("<span class='label label-danger'>"+error+"</span>").remove();//start button 대신 error message출력.
    						downloadTemplate.append(" <button class='btn btn-link btn-xs cancel' type='button'>cancel</button>");//cancel button append.
    						
    						downloadTemplate.find(".cancel").click(function(){ //cencle 클릭 이벤트 생성.
    							downloadTemplate.fadeOut(500,function(){
    															downloadTemplate.remove();
        														that._renderState();
        													});
        					});
    					}
		 			});
   					that._renderState();
		         	
	            }
	            ,_onChange: function (e) {
	            	var  fileInput= $(e.target)
	                    ,form=undefined
	                    ,files=undefined;
	            	
	            	//input file info get.
	            	files = this._getSingleFileInputFiles(fileInput);
	            	
	            	//file Input or Event copy
	            	fileInput.clone(true).prependTo(this.rootElement);//input 복사
	            	
	            	//폼생성
	    			form = this._createForm();
	    			fileInput.appendTo(form);
	    			
	    			//display
	    			this.add(form, files);
	            }
	            ,_getSingleFileInputFiles: function (fileInput) {
	                fileInput = $(fileInput);
	                /*var entries = fileInput.prop('webkitEntries') || fileInput.prop('entries'), files, value;
	                if (entries && entries.length) {
	                    return this._handleFileTreeEntries(entries);
	                }*/
	                var files = $.makeArray(fileInput.prop('files'));
	                if (!files.length) {
	                    value = fileInput.prop('value');
	                    if (!value) {
	                        //return $.Deferred().resolve([]).promise();
	                    	return [];
	                    }
	                    // If the files property is not available, the browser does not
	                    // support the File API and we add a pseudo File object with
	                    // the input value as name with path information removed:
	                    files = [{name: value.replace(/^.*\\/, '')}];
	                } else if (files[0].name === undefined && files[0].fileName) {
	                    // File normalization for Safari 4 and Firefox 3:
	                    $.each(files, function (index, file) {
	                        file.name = file.fileName;
	                        file.size = file.fileSize;
	                    });
	                }
	                //return $.Deferred().resolve(files).promise();
	                return files;
	            }
			};
			
			//옵션 설정.
			$options = $.extend({}, $options, o);
			
			//초기설정
			$options.init($(this));
			
			//화면 이동이나 저장하지 않고 화면 이동시 첨부파일 삭제.
			$(window).bind('beforeunload', function() {  
                var file={};
                var thisObjValue = $options.thisObjValue;
                if(thisObjValue){//update
                	file.register_id = "temp";
                	file.atch_file_id = thisObjValue; 
                }else{//create
                	file.atch_file_id = $options.thisObj.val(); 
                }
				
				//temp 파일삭제..
                $options._atchFileDelete(file); 
				//페이지 변경이 있었는지 체크..  
			     // var isChanged = ....;   
			     //출력할 내용을 Return 해주면 확인 창이 뜨게 됩니다.  
			     //if(isChanged)   
			     //return '변경된 사항이 있습니다. 페이지에서 나가시겠습니까?';
			     //확인 창을 띄우지 않으려면 아무 내용도 Return 하지 마세요!! (Null조차도)  
			});  
					 //Form Submit 등 onBeforeUnload Event가 발생하길 원하지 않는 경우, 이벤트 해제  
			$('form').submit(function() {  
			     $(window).unbind('beforeunload');   
			}); 
			
		};	
	
	})(jQuery);
	
	
	
	
	
	//select tag 상위 태그를 지정하여 상위태그 변경 이벤트시 해당값에 해당하는것만 하위 select에서 디스플레이 해준다.
	(function($){
		'use strict';	
		$.fn.upperObj = function(param_upperObj){
			var $that = $(this);
			
			//인자로 받은 오브젝트 객체에 동력으로 change event를 설정해준다.
			param_upperObj.change(function(){ 
				var upperVal=$(this).val();
				//wrap로 감싼 option default로 hide 가 된다...왜그런지는 잘 모르겟다...그냥 그러하다.
				$that.find("option:not(span > option)").wrap( "<span>" ).parent().hide();
				
				if(upperVal != "" && upperVal !=null){
					$that.find("option:first").unwrap();
					$that.find("option[class="+upperVal+"]").unwrap();
					
				}else{
					$that.find("option").unwrap("<span>" );
				}
			});
			//플러그인 호출 되고 트렌젝션이 발생하면 최초 상태가 풀리기때문에 강제로 타겟 Obj대한 가제 change 이벤트를 발생시킨다.
			param_upperObj.trigger("change");
		};
	})(jQuery);
	
	
	
	
	
	//이미지 슬라이드
	(function($){
		$.fn.autoSlide = function(o){

			var option = {  		
				 autoSlideAt: true
				,autoSlideSec:1000
				,circleBtnAt:true
				,fadeAt:true
				,fadeOutSec:10
				,fadeInSec:1000
				,nextBtn:true
				,hoverAt:true
				,init:function(){
					$(div_sub).css("width", sub_div_w + "px");
					$(div_sub).children(":last").prependTo($(div_sub));
					$(div_sub).css('margin-left', (div_w * -1)+"px");
					$(circleBtn).find("a").eq(0).addClass("select");
				}
				,_mouseIn:function(){
					if(this.autoSlideAt){
						clearInterval(myControl);
					}
				}
				,_mouseOut:function(){
					if(this.autoSlideAt){
						myControl = setInterval(function(){ $(nextBtn).trigger('click');},this.autoSlideSec);	 
					}
				}
				,_autoSlide:function(){
					myControl = setInterval(function(){ $(nextBtn).trigger('click');},this.autoSlideSec);	 
				}
				,_moveNext:function(){
					//메인슬라이딩
					$(div_sub).stop(true,true).animate({marginLeft:"-="+(div_w)+"px"}, 'slow', function(){
						$(div_sub).children(":first").appendTo($(div_sub)); //첫번째 이미지 -> 마지막으로 이동
						$(div_sub).css('margin-left', ((div_w) * -1)+"px");	
					});	
				}
				,_movePrev:function(){
					$(div_sub).stop(true,true).animate({marginLeft:"+="+(div_w)+"px"}, 'slow', function(){	
						//마지막 이미지 -> 첫번째로 이동
						$(div_sub).children(":last").prependTo($(div_sub)); 
						$(div_sub).css('margin-left', ((div_w) * -1)+"px");	
					});		
				}
				,_moveIndex:function(index){
					
					var tmpIndex = index;
					
					if((tmpIndex-1) < 0 ){
						tmpIndex = img_c;
					}
					//모든 이미지를 each로 참조하여 선택된 이미지가 두번째에 위치하게끔 해야한다. - 선택한 이미지가 나올때까지 만나는 이미지를 맨 마지막으로 이동시킨다. 
					var tmpId = null;
					for(var i=0; i < img_c; i++){
						tmpId = $(div_sub).children(":first").attr("id");
						//alert(tmpId);
						if(tmpId == (tmpIndex-1)){
							break;
						}
						//첫번째 이미지 -> 마지막으로 이동
						$(div_sub).children(":first").appendTo($(div_sub)); 
					}
				}
				,_circleBtnSelector:function(index){
					$(circleBtn).find("a").removeClass("select");
					$(circleBtn).find("a").eq(index).addClass("select");	 
				}
				
			};
			
		
			//옵션 머지.
			option = $.extend({}, option, o);

			//대상DIV width
			var div_w = $(this).width();
			//대상DIV height
			var div_h = $(this).height();
			
			//이미지 총 수
			var img_c = $(this).find("img").length; 
			//모든 이미지가 일열로 배치 되도록 DIV 가로폭을 준다.	
			var sub_div_w = div_w*img_c;
			
			//1.현재 보여지는 이미지 인덱스
			var img_i = 0;
			
			//2.타겟 DIV 안에 이미지를 감싸는 sub div를 동적 생성해준다.
			$(this).html("<div id='div_sub'>"+$(this).html()+"</div>");
			var div_sub = $(this).find("#div_sub");//고정 꼭있어야함.
			

			//3.next 버튼 동적 생성
			if(option.nextBtn){
				var strHtml = "<div class='dir'>"
							  +"	<div class='prev'></div>"
							  +"	<div class='next'></div>"
							  +"</div>";
				$(this).append(strHtml);
			}
			var nextBtn = $(this).find(".next");
			var prevBtn = $(this).find(".prev");
			
			//
			if(option.circleBtnAt){
				var strHtml = "<div class='circle_btn'><ul>";
				
				for(var i=0; i < img_c; i++){
					strHtml = strHtml + "<li><a href='#'  id='"+i+"' class='boxBtn'></a></li>";
				}
				
				strHtml = strHtml + "</ul></div>";
				//$(strHtml).insertAfter(this);
				$(this).append(strHtml);
			}
			var circleBtn = $(this).find(".circle_btn");
	
			//4.이미지를 이동시킬때 이미지를 감쌀수있는 예를 들어 <a>태그같은 것도 같이 이동 시켜야 하기 때문에 .children() 을 이용했다.
			$(div_sub).children().each(function(i){
				//이미지를 감싸고 있는 태그에 index id를 설정 - 만약 감싸고 있지 않으면 <img>태그 id 속성에 index 설정한다.
				$(this).attr("id",i);
				
				//모든 이미지를 DIV  width/height 크기로 셋팅한다.
				$(div_sub).find("img").eq(i).css("width", div_w + "px").css("height", div_h + "px");
			});

			//5.초기화-이미지를 TARGET DIV(image count * div size 크기로 셋팅한다)
			option.init();
			

			//prev 이벤트 등록
			$(prevBtn).click(function(){ 
			   option._movePrev();

			   //페이지 인덱스 감소
				img_i = Number(img_i)-1;
				if(img_i < 0 ){
					img_i = Number(img_c)-1;
				}  
				
				//boxBtn 표시 변경
				option._circleBtnSelector(img_i); //boxBtn 표시 변경
			});
			
			//next 이벤트 등록
			$(nextBtn).click(function(){
			   option._moveNext();
			   
			   //페이지 인덱스 증가
				img_i = Number(img_i)+1;
				if(img_i >= img_c){
					img_i = 0;
				}
				//boxBtn 표시 변경
				option._circleBtnSelector(img_i); 
			});

			//circleBtn 이벤트 등록
			$(circleBtn).find(".boxBtn").click(function(){
				var index = $(this).attr("id");

				if(option.fadeAt){
					$(div_sub).fadeOut(option.fadeOutSec ,function(){ 
											//선택된 페이지로 이동
											option._moveIndex(index);
											$(div_sub).stop(true,true).fadeIn(option.fadeInSec);
									   });
				}else{
					//선택된 페이지로 이동
					option._moveIndex(index);
				}

				img_i = index;//그로벌 변수에 선택 index 설정
				option._circleBtnSelector(index); //boxBtn 표시 변경

			});

			var myControl;
			
			//main div hover 이벤트
			if(option.hoverAt){
				
				$(this).hover(function(){
									if(option.autoSlideAt){
										option._mouseIn();	
									}
							  },
							  function(){ 
									if(option.autoSlideAt){
										option._mouseOut();
									}
							  });
			}

			//오토 슬라이드 등록
			if(option.autoSlideAt){
				option._autoSlide();	 
			}

			
		};

	})(jQuery);	
