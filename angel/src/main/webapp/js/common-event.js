// JavaScript Document

	// 팝업 리사이즈	
	
	//벨리데이션 옵션
	$(function(){
		
		$.extend(true,$.validator.messages, {
					required:function(element,input){
						var text = $('label[for="'+ input.name +'"]').html()+" 은(는) 필수 입력값 입니다.";
						return text;
					}
					 // required: "은(는) 필수 항목입니다."
					 ,remote: "수정 바랍니다."
					 ,email: "이메일 주소를 올바로 입력하세요."
					 ,url: "URL을 올바로 입력하세요."
					 ,date: "날짜가 잘못 입력됐습니다."
					 ,dateISO: "ISO 형식에 맞는 날짜로 입력하세요."
					 ,number: "숫자만 입력하세요."
					 ,digits: "숫자(digits)만 입력하세요."
					 ,alphanumeric:"알파벳과 숫자만 사용가능합니다."
					 ,creditcard: "올바른 신용카드 번호를 입력하세요."
					 ,equalTo: "값이 서로 다릅니다."
					 ,accept: "승낙해 주세요."
					 ,maxlength: jQuery.validator.format("{0}글자 까지 입력 가능합니다.")
					 ,minlength: jQuery.validator.format("{0}글자 이상  입력해야 합니다.")
					 ,rangelength: jQuery.validator.format("{0}글자 이상 {1}글자 이하로 입력해 주세요.")
					 ,range: jQuery.validator.format("{0}에서 {1} 사이의 값 입력이 가능합니다.")
					 ,max: jQuery.validator.format("{0} 이하로 입력해 주세요.")
					 ,min: jQuery.validator.format("{0} 이상으로 입력해 주세요.")
		});	
		
		$.validator.setDefaults({
			onkeyup:false,
			onclick:false,
			onfocusout:false,
			showErrors:function(errorMap, errorList){
				if(this.numberOfInvalids()) { // 에러가 있을 때만..
					if( errorList[0] != undefined){
						var caption = errorList[0].message.replace("*", "");
						alert(caption);
						$(errorList[0].element).focus();
						//alert($(errorList[0].element).val());
					}
				}
			}
		});
		
	});
		
		

 //달력 옵션
 var datePickerOption={
		 autoSize:false     //오토리사이즈(body등 상위태그의 설정에 따른다.
		 ,buttonImage:'img/common/btn_calendar.gif'
		 ,buttonImageOnly:true//이미지표시
		 ,buttonText:'달력'//버튼 텍스트 표시
		 ,changeMonth:true   //월변경가능
		 ,changeYear:true    //년변경가능
		 ,closeText:'닫기'
		 ,currentText:'오늘'
		 ,dateFormat: 'yy-mm-dd'
		 ,dayNames:      ['일','월','화','수','목','금','토']
		 ,dayNamesMin:   ['일','월','화','수','목','금','토']// 요일의 한글형식
		 ,dayNamesShort: ['일','월','화','수','목','금','토']
		 ,firstDay:0
		 ,isRTL: false
		 ,monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)']
		 ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']//월의 한글 형식
		 ,nextText:'다음달'
		 ,numberOfMonths:[1,1]//한번에 몇개의 달력을 표시할것인가 [2,3]일 경우,2(행)x3(3열)=6개의 달력을 표시한다.
		 ,prevText:'이전달'
		 ,showButtonPanel:true//Default: true 캘린더 하단에 버튼 패널을 표시한다.
		 ,showMonthAfterYear: true//년 뒤에 월 표시
		 ,showOn:"both"//엘리먼트와 이미지 동시 사용[both,button]
		 ,weekHeader: 'Wk'
		 ,yearRange:'1900:2020'//1900뇬부터2020년까지
		 ,yearSuffix:''
		 //beforeShow
		 //beforeShowDay
		 //altField
		 // altFormat
		 //appendText
		 //calculateWeek
		 //constrainInput
		 //defaultDate
		 //duration
		 //gotoCurrent
		 //hideIfNoPrevNext
		 //maxDate
		 //minDate
		 //navigationAsDateFormat
		 //onChangeMonthYear
		 //onClose
		 //onSelect
		 //selectOtherMonths
		 //shortYearCutoff
		 //showAnim
		 //showCurrentAtPos
		 //showOptions
		 //showOtherMonths
		 //showWeek
		 //stepMonths
			 
		 /*
		  * d - day of month (no leading zero)
		  * dd - day of month (two digit)
		  * o - day of the year (no leading zeros)
		  * oo - day of the year (three digit)
		  * D - day name short
		  * DD - day name long
		  * m - month of year (no leading zero)
		  * mm - month of year (two digit)
		  * M - month name short
		  * MM - month name long
		  * y - year (two digit)
		  * yy - year (four digit)
		  * @ - Unix timestamp (ms since 01/01/1970)
		  * ! - Windows ticks (100ns since 01/01/0001)
		  * '...' - literal text
		  * '' - single quote
		  * anything else - literal text*/
	 
 };
		
 var timePickerOption={
			//amNames	//Default: ['AM', 'A'], A Localization Setting - Array of strings to try and parse against to determine AM. 
			//pmNames		//Default: ['PM', 'P'], A Localization Setting - Array of strings to try and parse against to determine PM. 
			timeFormat: 'HH:mm'	//Default: "HH:mm", A Localization Setting - String of format tokens to be replaced with the time. See Formatting. 
			//timeSuffix	//Default: "", A Localization Setting - String to place after the formatted time. 
			//timeOnlyTitle	//Default: "Choose Time", A Localization Setting - Title of the wigit when using only timepicker. 
			,timeText:"시간"	//Default: "Time", A Localization Setting - Label used within timepicker for the formatted time. 
			,hourText:'시'	//Default: "Hour", A Localization Setting - Label used to identify the hour slider. 
			,minuteText:'분' 	//Default: "Minute", A Localization Setting - Label used to identify the minute slider. 
			,secondText:'초'	//Default: "Second", A Localization Setting - Label used to identify the second slider. 
			//millisecText	//Default: "Millisecond", A Localization Setting - Label used to identify the millisecond slider. 
			//microsecText	//Default: "Microsecond", A Localization Setting - Label used to identify the microsecond slider. 
			//timezoneText	//Default: "Timezone", A Localization Setting - Label used to identify the timezone slider. 
			//isRTL		//Default: false, A Localization Setting - Right to Left support. 

			//Alt Field Options
			//altFieldTimeOnly	//Default: true - When altField is used from datepicker altField will only receive the formatted time and the original field only receives date. 
			//altSeparator		//Default: (separator option) - String placed between formatted date and formatted time in the altField. 
			//altTimeSuffix		//Default: (timeSuffix option) - String always placed after the formatted time in the altField. 
			//altTimeFormat		//Default: (timeFormat option) - The time format to use with the altField. 
			//altRedirectFocus	//Default: true - Whether to immediately focus the main field whenever the altField receives focus. Effective at construction time only, changing it later has no effect. 

			//Timezone Options
			//timezoneList	//Default: [generated timezones] - An array of timezones used to populate the timezone select. Can be an array of values or an array of objects: { label: "EDT", value: -240 }. The value should be the offset number in minutes. So "-0400" which is the format "-hhmm", would equate to -240 minutes. Time Field Options
			,controlType:'slider'
			//controlType	//Default: 'slider' - Whether to use 'slider' or 'select'. If 'slider' is unavailable through jQueryUI, 'select' will be used. For advanced usage you may pass an object which implements "create", "options", "value" methods to use controls other than sliders or selects. See the _controls property in the source code for more details. 
					/*{
						create: function(tp_inst, obj, unit, val, min, max, step){	
							// generate whatever controls you want here, just return obj
						},
						options: function(tp_inst, obj, unit, opts, val){
							// if val==undefined return the value, else return obj
						},
						value: function(tp_inst, obj, unit, val){
							// if val==undefined return the value, else return obj
						}
					}*/
			
			,showHour:true       //Default:true //Default: null - Whether to show the hour control. The default of null will use detection from timeFormat. 
			,showMinute:true     //Default:true //Default: null - Whether to show the minute control. The default of null will use detection from timeFormat. 
			,showSecond:false     //Default:false //Default: null - Whether to show the second control. The default of null will use detection from timeFormat. 
			,showMillisec:false  //Defaultt:false //Default: null - Whether to show the millisecond control. The default of null will use detection from timeFormat. 
			//showMicrosec	//Default: null - Whether to show the microsecond control. The default of null will use detection from timeFormat. 
			,showTimezone:false  //Default:false //Default: null - Whether to show the timezone select. 
			,showTime:true      //Default:true //Default: true - Whether to show the time selected within the datetimepicker. 
				
			//stepHour	//Default: 1 - Hours per step the slider makes. 
			,stepMinute:10	//Default: 1 - Minutes per step the slider makes. 
			,stepSecond:10	//Default: 1 - Seconds per step the slider makes. 
			//stepMillisec	//Default: 1 - Milliseconds per step the slider makes. 
			//stepMicrosec	//Default: 1 - Microseconds per step the slider makes. 
			//hour		//Default: 0 - Initial hour set. 
			//minute		//Default: 0 - Initial minute set. 
			//second		//Default: 0 - Initial second set. 
			//millisec	//Default: 0 - Initial millisecond set. 
			//microsec	//Default: 0 - Initial microsecond set. Note: Javascript's native Date object does not natively support microseconds. Timepicker adds ability to simply Date.setMicroseconds(m) and Date.getMicroseconds(). Date comparisons will not acknowledge microseconds. Use this only for display purposes. 
			//timezone	//Default: null - Initial timezone set. This is the offset in minutes. If null the browser's local timezone will be used. If you're timezone is "-0400" you would use -240. For backwards compatibility you may pass "-0400", however the timezone is stored in minutes and more reliable. 
			//hourMin		//Default: 0 - The minimum hour allowed for all dates. 
			//minuteMin	//Default: 0 - The minimum minute allowed for all dates. 
			//secondMin	//Default: 0 - The minimum second allowed for all dates. 
			//millisecMin	//Default: 0 - The minimum millisecond allowed for all dates. 
			//microsecMin	//Default: 0 - The minimum microsecond allowed for all dates. 
			//hourMax		//Default: 23 - The maximum hour allowed for all dates. 
			//minuteMax	//Default: 59 - The maximum minute allowed for all dates. 
			//secondMax	//Default: 59 - The maximum second allowed for all dates. 
			//millisecMax	//Default: 999 - The maximum millisecond allowed for all dates. 
			//microsecMax	//Default: 999 - The maximum microsecond allowed for all dates. 
			//hourGrid	//Default: 0 - When greater than 0 a label grid will be generated under the slider. This number represents the units (in hours) between labels. 
			//minuteGrid	//Default: 0 - When greater than 0 a label grid will be generated under the slider. This number represents the units (in minutes) between labels. 
			//secondGrid	//Default: 0 - When greater than 0 a label grid will be genereated under the slider. This number represents the units (in seconds) between labels. 
			//millisecGrid	//Default: 0 - When greater than 0 a label grid will be genereated under the slider. This number represents the units (in milliseconds) between labels. 
			//microsecGrid	//Default: 0 - When greater than 0 a label grid will be genereated under the slider. This number represents the units (in microseconds) between labels. 
			//Other Options
			//-showButtonPanel //Default: true - Whether to show the button panel at the bottom. This is generally needed. 
			//timeOnly	//Default: false - Hide the datepicker and only provide a time interface. 
			//timeOnlyShowDate //Default: false - Show the date and time in the input, but only allow the timepicker. 
			//onSelect	//Default: null - Function to be called when a date is chosen or time has changed (parameters: datetimeText, datepickerInstance). 
			//alwaysSetTime	//Default: true - Always have a time set internally, even before user has chosen one. 
			//separator	//Default: " " - When formatting the time this string is placed between the formatted date and formatted time. 
			//pickerTimeFormat //Default: (timeFormat option) - How to format the time displayed within the timepicker. 
			//pickerTimeSuffix //Default: (timeSuffix option) - String to place after the formatted time within the timepicker. 
			//showTimepicker	//Default: true - Whether to show the timepicker within the datepicker. 
			//addSliderAccess //Default: false - Adds the sliderAccess plugin to sliders within timepicker 
			//sliderAccessArgs //Default: null - Object to pass to sliderAccess when used. 
			//defaultValue	//Default: null - String of the default time value placed in the input on focus when the input is empty. 
			//minDateTime	//Default: null - Date object of the minimum datetime allowed. Also available as minDate. 
			//maxDateTime	//Default: null - Date object of the maximum datetime allowed. Also Available as maxDate. 
			//minTime		//Default: null - String of the minimum time allowed. '8:00 am' will restrict to times after 8am 
			//maxTime		//Default: null - String of the maximum time allowed. '8:00 pm' will restrict to times before 8pm 
			//parse		//Default: 'strict' - How to parse the time string. Two methods are provided: 'strict' which must match the timeFormat exactly, and 'loose' which uses javascript's new Date(timeString) to guess the time. You may also pass in a function(timeFormat, timeString, options) to handle the parsing yourself, returning a simple object:
	};
 var dateTimePickerOption=$.extend({},datePickerOption, timePickerOption);
/* var clareCalendar={
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']//월의 한글 형식
		,monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)','7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)']
		,dayNames:      ['일','월','화','수','목','금','토']
		,dayNamesShort: ['일','월','화','수','목','금','토']
		,dayNamesMin:   ['일','월','화','수','목','금','토']// 요일의 한글형식
		,numberOfMonths:[1,1]//한번에 몇개의 달력을 표시할것인가 [2,3]일 경우,2(행)x3(3열)=6개의 달력을 표시한다.
		,weekHeader: 'Wk'
		,dateFormat: 'yy-mm-dd'
		,timeFormat: 'HH:mm'
		,showHour:true       //Default:true
		,showMinute:true     //Default:true
		,showSecond:false     //Default:false
		,showMillisec:false  //Defaultt:false
		,showTime:false      //Default:true
		,showTimezone:false  //Default:false
		,showButtonPanel:true//Default: true 캘린더 하단에 버튼 패널을 표시한다.
		,autoSize:false     //오토리사이즈(body등 상위태그의 설정에 따른다.
	 	,changeMonth:true   //월변경가능
	 	,changeYear:true    //년변경가능
	 	,showMonthAfterYear: true//년 뒤에 월 표시
	 	,buttonImageOnly:true//이미지표시
	  	,buttonText:'달력'//버튼 텍스트 표시
	  	,buttonImage:'../images/btn_calendar.gif'
	  	,showOn:"both"//엘리먼트와 이미지 동시 사용[both,button]
	  	,yearRange:'1900:2020'//1900뇬부터2020년까지
		,closeText:'닫기'
		,prevText:'이전달'
		,nextText:'다음달'
		,timeText:'시간'
		,hourText:'시'
		,minuteText:'분'
		,secondText:'초'
		,currentText:'오늘'
		,firstDay:0
		,isRTL: false
		,yearSuffix:''
		,controlType:'select'//시간 선택 타입 [select|slider]-default slider
};*/
 


	//textarea 내용을 출력할때 개행 문자와 스페이스 를 치환해준다.
	$(function(){	
		var str;
		$(".textarea").each(function(){
			str = $(this).html().replace(/(\n|\n\n)/gi, "<br/>");
			str = str.replace(/(\r)/g,'&nbsp;');
			$(this).html(str);
			
		});
	});

	
	
	
	
	//date
	$(function() {
		//var option = {};
		//option.dateFormat = "yy-mm-dd";
		
		$(".date").each(function(index){
			$(this).date();
		}); 
	}); 
	
	//dateTime
	$(function() {
		//var option = {};
		//option.dateFormat = "yy-mm-dd";
		//option.timeFormat = "HH:mm";
		$(".dateTime").each(function(index){
			$(this).dateTime();
		}); 
	}); 
	
	//time
	$(function() {
		var option = {};
		option.timeOnly=true;
		option.buttonText='시간';//버튼 텍스트 달력->시간 변경
		//option.timeFormat = "HH:mm";
		$(".time").each(function(index){
			$(this).time(option);
		}); 
	}); 
	
	//datePeriod
	$(function() {
		//var option = {};
		//option.dateFormat = "${dateFormat}";
		$(".datePeriod").each(function(index){
			$(this).datePeriod();
		}); 
	}); 
	
	//dateTimePeriod
	$(function() {
		//var option = {};
		//option.dateFormat = "${dateFormat}";
		//option.timeFormat = "${timeFormat}";
		$(".dateTimePeriod").each(function(index){
			$(this).dateTimePeriod();
		}); 
		
	}); 
	
	//timePeriod
	$(function() {
		var option = {};
		option.timeOnly=true;
		option.buttonText='시간';//버튼 텍스트 달력->시간 변경
		//option.timeFormat = "HH:mm";
		$(".timePeriod").each(function(index){
			$(this).timePeriod(option);
		});
	}); 
	
	
		
	//공통 삭제 이벤트 메세지
	$(function(){		
		//삭제 이벤트 메세지
		$(".contentDelete").click(function(){
			var sub = confirm("삭제 하시겠습니까?");
			if(sub){ 
				return true;
			}else{
				return false;
			}
		});
	});
	
	
	//공통 등록 버튼 이벤트
	$(function(){		
		$(".submit, .submitBtn, .submitA").click(function(){
			//벨리데이션 체크 구현 페이지에서 벨리데이션 객체 생성
			var form  = $(this).closest('form');
			var valid = fnValid(form);
			
			if(valid){
				var atcionName = $(this).attr("title")||$(this).text()||$(this).attr("value");
				var thisClassName = $(this).attr("class");
				var sub = confirm(atcionName+" 하시겠습니까?");
				if(sub){
					if(thisClassName == "submitA"){//a 태그로 submit 을 할경우 form.submit()를 해줘야한다.
						//$("#actionForm").submit();
						$(form).submit(); //처음만나는 부모 선택
						return false;
					}else{
						return true;
					}
				}
			}
			return false;
		});
	});
	
	//베리데이션 을 실행하고 true,false값만 리턴한다. 만약 벨리데이트 플러그인 왜에 다른 작업을 할때에는 구현페이지에서 오버라디드 한다.
	function fnValid(form){
		var valid = $(form).valid();
		return valid;
	}
	
	//팝업 이벤트
	$(function(){		
		$(".popup").click(function(){
			var url = $(this).attr("href");
			var title = $(this).attr("title");
			
		    var popupwidth = '700';
		    var popupheight = '600';

		    Top = (window.screen.height - popupheight) / 3;
		    Left = (window.screen.width - popupwidth) / 2;
		    if (Top < 0) Top = 0;
		    if (Left < 0) Left = 0;
			var Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no, scrollbars=yes,resizable=yes,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
		    var PopUpWindow = window.open(url, title, Future);
		    PopUpWindow.focus();
		    
		    return false;
		});
	});
	