 $(document).ready(function(){
	 $("#jumin1").keyup(function(){
	      var jumin1 =$("#jumin1"); 
	    
	      //주민번호 앞자리 6자리인 경우
	      if ($("#jumin1").val().length == 6)
	    	   {
	    	     if($.isNumeric($("#jumin1").val())) //6자리가 숫자인 경우
	    	    	 $("#jumin2").focus();
	    	     else                     //6자리가 숫자가 아닌 경우
	    	    	 {
	    	    	   alert("숫자로 입력하세요"); 
	    	    	   $("#jumin1").val("");  //앞자리 모두 초기화
	    	           $("#jumin1").focus();   //앞자리에 포커스 준다.
	    	          }
	    	   }
	 })
	       //주민번호 뒷자리 7자리인 경우
	  $("#jumin2").keyup(function(){
		  var jumin2 =$("#jumin2"); 
		   
		  if ($("#jumin2").val().length == 7)
	       {
	    	   if(!isNaN($("#jumin2").val())) //7자리가 숫자인 경우
	    	    	 $("#email").focus();
	    	     else                     //7자리가 숫자가 아닌 경우
	    	    	 {
	    	    	   alert("숫자로 입력하세요"); 
	    	    	   $("#jumin2").val("");  //뒷자리 모두 초기화
	    	           $("#jumin2").focus();   //뒷자리에 포커스 준다.
	    	          }
	    	   
	       }
	     } );
	   
	   //ID 중복 검사 부분
	   $("#idcheck").click(function (){
	    if($.trim($("#id").val()) ==''){  // ID를 입력하지 않았을 경우
	     alert("ID를 입력하세요");
	     $("#id").focus();
	     return false;
	    }else{     // ID를 입력했을 경우
	     var ref="idcheck.html";//사용자가 입력한 방식을 get방식으로 넘깁니다. 
	                             //팝업창을 이용한 자료를 넘김   
	        window.open(ref,"idcheck","width=300, height=250")
	        //팝업창에 idcheck.html의 결과가 나타납니다.
	    }     
	   });
	   
	   
	   //select 태그에서 선택한 도메인 설정하는 부분
	   $("#sel").change(function (){
	    if($("#sel").val() ==""){ //직접 입력 선택한 경우
	    	$("#domain").val("").focus();
	    	$("#domain").attr("disabled",false);//활성화
	    }else{//도메인 선택한 경우
	    	$("#domain").val($("#sel").val());
	    	$("#domain").attr("disabled","disabeld");//비활성화
	    }
	   });
	   
	   //우편 검색 
	   $("#postcode").click(function(){
	    window.open("post.html","post","width=400, height=300")
	   });

	   //회원가입 버튼 클릭했을 경우
	   $("form").submit(function (){     
		   //id 공백 유효성 검사
	       if($.trim($("#id").val()) == ""){
	          alert("ID를 입력 하세요");
	          $("#id").focus();
	          return false;
	      }
	     
	     //비밀번호 공백 유효성 검사
	     if($.trim($("#pass").val()) == ""){
	      alert("비밀번호를 입력 하세요");
	      $("#pass").focus();
	      return false;
	     }
	     
	     //주민번호 앞자리 공백 유효성 검사
	     if($.trim($("#jumin1")) == ""){
	      alert("주민번호 앞자리를 입력하세요");
	      $("#jumin1").focus();
	      return false;
	     } 
	     
	     //주민번호 앞자리 6자리 유효성 검사
	     if($.trim($("#jumin1").val().length) !=6){
	      alert("주민번호 앞자리 6자리를 입력하세요");
	      $("#jumin1").val("");
	      $("#jumin1").focus();
	      return false;
	     }   
	          
	     //주민번호 앞자리 숫자 유효성 검사
	     if(!$.isNumeric($("#jumin1").val())){ //숫자가 아닌 경우
	      alert("주민번호 앞자리는 숫자만 입력 가능합니다.");
	      $("#jumin1").val("");
	      $("#jumin1").focus();
	      return false;      
	     }
	     
	   //주민번호 뒷자리 공백 유효성 검사
	     if($.trim($("#jumin2")) == ""){
	      alert("주민번호 뒷자리를 입력하세요");
	      $("#jumin2").focus();
	      return false;
	     } 
	     
	     //주민번호 뒷자리 6자리 유효성 검사
	     if($.trim($("#jumin2").val().length) !=7){
	      alert("주민번호 뒷자리 7자리를 입력하세요");
	      $("#jumin2").val("");
	      $("#jumin2").focus();
	      return false;
	     }   
	          
	     //주민번호 뒷자리 숫자 유효성 검사
	     if(!$.isNumeric($("#jumin2").val())){ //숫자가 아닌 경우
	      alert("주민번호 뒷자리는 숫자만 입력 가능합니다.");
	      $("#jumin2").val("");
	      $("#jumin2").focus();
	      return false;      
	     }
	     
	     //email 공백 유효성 검사
	     if($.trim($("#email").val()) ==""){
	      alert("E-mail id를 입력하세요");
	      $("#email").focus();
	      return false;
	     }
	     
	     //domain 공백 유효성 검사
	     if($.trim($("#domain").val()) ==""){
	      alert("E-mail 도메인 주소를 입력하세요");
	      $("#domain").focus();
	      return false;
	     }  
	     
	     //라디오 버튼 선택 유효성 검사
	     /*if($("#gender1")is(":checked") == false &&
	     $("#gender2").is(":checked") == false){
	        alert("남, 여 중에서 1개를 선택하세요");
	          return false;}*/
	     
	     if($('input:radio:checked').length==0){
	    	 alert("남자, 여자중에서 선택하세요");
	    	 return false;
	     }
	     
	     //취미를 2개 이상 체크하도록 하는 유효성 검사     
	 /*    var hobby1=$("hobby1");
	     var hobby2=$("hobby2");
	     var hobby3=$("hobby3");
	     var hobby4=$("hobby4");
	     var hobby5=$("hobby5");
	     
	     if(hobby1.checked) cnt++;
	     if(hobby2.checked) cnt++;
	     if(hobby3.checked) cnt++;
	     if(hobby4.checked) cnt++;
	     if(hobby5.checked) cnt++; 
	      */
	     var cnt=$('input:checkbox:checked').length;
	     
	     if(cnt<2){
	         alert("2개이상 취미를 선택하세요");
	         return false;
	     }     
	     
	      //우편번호 앞자리  공백 유효성 검사
	     if($.trim($("#post1").val()) ==""){
	        alert("우편번호 앞자리 입력하세요")
	        $("#post1").focus();
	        return false;
	     }
	     
	     //우편번호 뒷자리 공백 유효성 검사
	     if($.trim($("#post2").val()) ==""){
	         alert("우편번호 뒷자리 입력하세요")
	         $("#post2").focus();
	         return false;
	      }
	     
	   //주소 공백 유효성 검사
	     if($.trim($("#address").val()) == ""){
	      alert("주소를 입력하세요")
	      $("#address").focus();
	      return false;
	     }
	     
	   //자기소개 공백 유효성 검사
	     if($.trim($("intro").val()) ==""){
	      alert("자기 소개를 입력하세요")
	      $("#intro").focus();
	      return false;
	     }
	   
	   });  
	  
 });
  