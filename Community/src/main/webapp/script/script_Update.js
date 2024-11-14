
$(function(){
	
	// 필수입력 영역 배경색 적용
	$("#regFrmTbl td.req").parent("tr").css({
		"background-color": "rgba(128, 128, 128, 0.07)"
	});
	
	// 선택된 Email 도메인 자동입력  
	$("#regFrm select#emailDomain").change(function(){
		// change 이벤트 핸들러 => value값이 변경되었을때 인식하는 이벤트
		let emailDomain = $(this).val().trim();
		$("input#uEmail_02").val(emailDomain);
		if (emailDomain == "") {
			$("input#uEmail_02").focus();
		} else {
			$("input#uEmail_01").focus();
		}
	});
	
	
	// 아이디 중복체크 팝업 
	$("#regFrm button#idChkBtn").click(function(){
		
		let uId = $("#uId").val().trim();    // <input id="uId">의 값 반환
		//alert("uId.length : " + uId.length);
		$("#uId").val(uId);
		
		// 정규표현식 시작
		let regExp = /[^a-z|A-Z|0-9]/g;
		let rExpRes = regExp.test(uId);   // 정규표현식에 부합하면 true
														   // 정규표현식에 부합하면지 않으면 false
		//alert("rExpRes : " + rExpRes);	
		// 정규표현식 끝		
		
		
		if (uId == "") {    // 전체 공백 체크
			
			alert("아이디를 입력해주세요");
			$("#uId").focus();
			
		} else if (uId.length < 3) {    // 글자수 체크
		
			alert("아이디는 최소 3글자 이상입니다.");
			$("#uId").focus();
			
		} else if (rExpRes) {    // 정규표현식 체크
		
			alert("영어대/소문자, 숫자 조합만 가능합니다.");
			$("#uId").focus();
			
		} else {			
			
			let url = "/member/idCheck.jsp?uId=" + uId;
			let nickName = "idChkPop";
	
			let w = screen.width;     // 1920
			let popWidth = 480;
			let leftPos = (w - popWidth) / 2; // left Position 팝업창 왼쪽 시작위치
	
			let h = screen.height;    // 1080
			let popHeight = 320;
			let topPos = (h - popHeight) / 2; 		
			
	
			let prop = "width="+ popWidth +", height="+ popHeight;
				  prop += ", left=" + leftPos + ", top=" + topPos; 
			window.open(url, nickName, prop);
		
		}		
	});

	
	// 비밀번호 표시하기 
	$("#wrap #regFrmTbl input#pwView").click(function(){
		let chkTF = $(this).prop("checked");     ;     // YN => Yes or No,   TF => True or False
		//alert("chkTF : " + chkTF);
		if (chkTF) {
			$("input#uPw").attr("type", "text");
		} else {
			$("input#uPw").attr("type", "password");
		}
	});
	
	// 비밀번호 / 비밀번호 확인 동일성 검사   +  유효성검사(정규표현식)
	$("#uPw_Re").keyup(function(){ 
		let uPw = $("#uPw").val();
		let uPw_Re = $("#uPw_Re").val();
		
		// after( )메서드는 선택자로 지정된 요소 다음에 생성되는 요소를 만드는 기능
		if (uPw != uPw_Re) {
			$("span#pwChk").text("비밀번호가 다릅니다.");
		} else {
			$("span#pwChk").text("");
		}
		
	});
	
	// Email 유효성 검사 => 공백검사만!
	$("#emailAuthBtn").click(function(){
		
		let uEmail_01 = $("#uEmail_01").val().trim();
		let uEmail_02 = $("#uEmail_02").val().trim();
		
		if (uEmail_01 == "") {
			alert("이메일 주소를 확인해주세요");
			$("#uEmail_01").focus();			
		} else if (uEmail_02 == "") {
			alert("이메일 주소를 확인해주세요");
			$("#uEmail_02").focus();
		} else {
			$("#emailAuthArea").css({"display": "block"});
		}
		
		
	});
	
	
	// 우편번호 찾기 팝업 
	$("#regFrm button#findZipBtn").click(function(){
		
		let url = "/member/zipCheck.jsp";
		let nickName = "zipChkPop";

		let w = screen.width;     // 1920
		let popWidth = 640;
		let leftPos = (w - popWidth) / 2; // left Position 팝업창 왼쪽 시작위치

		let h = screen.height;    // 1080
		let popHeight = 400;
		let topPos = (h - popHeight) / 2; 		
		
		let prop = "width="+ popWidth +", height="+ popHeight;
			  prop += ", left=" + leftPos + ", top=" + topPos; 
		window.open(url, nickName, prop);
		
	});
	
	
	// 우편번호 팝업창에서 주소 검색
	$("#addrSearchBtn").click(function(){
		let area3 = $("#area3").val().trim();
		if (area3 == "") {
			alert("검색어를 입력해주세요.");
			$("#area3").focus();
		} else {
			$("#zipFrm").submit();
		}
	});
	
	
	// 우편번호 팝업창에서 주소 선택
	$("table#zipResTbl td").click(function(){
		let txtAddr = $(this).children("span").text();
		let zipcode = txtAddr.substring(0, 7);
		let addr = txtAddr.substring(8);
		window.opener.uZipcode.value = zipcode;
		window.opener.uAddr.value = addr;
		window.close();
	});
	
	
	/* 회원가입 버튼 전송 실행 */	
	$("#updateSbmBtn").click(function(){		
		fnJoinSbm();
		console.log("Click")		
	});
	
	/* 폼실행 엔터키 이벤트 처리 */
	$(window).keydown(function(){
		let code = event.keyCode;
		if (code == 13) return false;
	});
	
	/* 폼실행 엔터키 이벤트 처리 */
	$(window).keyup(function(){		
		let code = event.keyCode;
		//alert("code : " + code);
		if (code == 13) fnJoinSbm();
    });

	function fnJoinSbm() {
		
		let uId = $("#uId").val();
		$("#uId").val(uId);
		let uPw = $("#uPw").val().trim();		
		$("#uPw").val(uPw);		
		let uPw_Re = $("#uPw_Re").val().trim();	
		let uName = $("#uName").val().trim();
		$("#uName").val(uName);
		let uEmail_01 = $("#uEmail_01").val().trim();
		let uEmail_02 = $("#uEmail_02").val().trim();
		$("#uEmail").val(uEmail_01+"@"+uEmail_02);
		let uBirthday = $("#uBirthday").val().trim();
		

		
		if (uId == "") {
			alert("아이디를 입력해주세요.");
			$("#uId").focus();
			return;
		} else if (uPw == "") {
			alert("비밀번호를 입력해주세요.");
			$("#uPw").focus();
			return;
		} else if (uPw_Re == "" || uPw != uPw_Re) {
			alert("비밀번호 일치여부를 확인해주세요.");
			$("#uPw_Re").focus();
			return;
		} else if (uName == "") {
			alert("이름을 입력해주세요.");
			$("#uName").focus();
			return;
		} else if (uEmail_01 == "") {
			alert("이메일 주소를 입력해주세요.");
			$("#uEmail_01").focus();
			return;
		} else if (uEmail_02 == "") {
			alert("이메일 주소를 입력해주세요.");
			$("#uEmail_02").focus();
			return;
		} else if (uBirthday != "" && isNaN(uBirthday)) {
			// 생년월일 숫자유효성 검사
			alert("생년월일은 숫자만 입력할 수 있습니다.");
			$("#uBirthday").val("").focus();
			return;
		} else {
			let chkSbmTF = confirm("정보를 수정 하시겠습니까?");
			if (chkSbmTF) {
				$("#regFrm").attr("action", "memberModProc.jsp");
				$("#regFrm").submit();
			}
		}	
	}
});

