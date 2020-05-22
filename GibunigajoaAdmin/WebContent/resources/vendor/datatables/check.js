	function checkAll(){    
		if (!checkSubject(form.subject.value)) {
            return false;
        }
        if (!checkContent(form.content.value)) {
            return false;
        }  
        return true;
    }

    // 공백확인 함수
    function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }
 
    function checkSubject(subject) {
        //기관명이 입력되었는지 확인하기
        if (!checkExistData(subject, "제목을")){
        	form.subject.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
    
    function checkContent(content) {
        //프로그램명이 입력되었는지 확인하기
        if (!checkExistData(content, "내용을")){
        	form.content.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
    
 
    