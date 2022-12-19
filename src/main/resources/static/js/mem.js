// function loginCheck(){ //로그인 유효성 검사 (아이디, 비번)
//     //1)아이디 5~10글자 이내인지 검사
//     let id=document.getElementById("id").value;
//     id=id.trim();
//     if(!(id.length>=5 && id.length<=10)){
//         alert("아아디 5~10글자이내 입력해 주세요");
//         document.getElementById("id").focus();
//         return false;
//     }//if end
//
//     //2)비밀번호 5~10글자 이내인지 검사
//     let passwd=document.getElementById("passwd").value;
//     passwd=passwd.trim();
//     if(!(passwd.length>=5 && passwd.length<=10)){
//         alert("비밀번호 5~10글자이내 입력해 주세요");
//         document.getElementById("passwd").focus();
//         return false;
//     }//if end
//
//     return true;
//
// }//loginCheck() end

/*
function memberCheck(){ //회원가입 유효성 검사
    //1)아이디 5~10글자 인지?
    let mem_id=document.getElementById("mem_id").value;
    mem_id = mem_id.trim();
    if(!(mem_id.length>=5 && mem_id.length<=10)){
        alert("아아디 5~20글자이내 입력해 주세요");
        document.getElementById("mem_id").focus();
        return false;
    }//if end

    //2)비밀번호 5~10글자 인지?
    let pw=document.getElementById("pw").value;
    pw=pw.trim();
    if(!(pw.length>=5 && pw.length<=10)){
        alert("비밀번호 5~20글자이내 입력해 주세요");
        document.getElementById("pw").focus();
        return false;
    }//if end

    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
    let repw=document.getElementById("repw").value;
    repw=repw.trim();
    if(pw!=repw){
        alert("비밀번호 2개를 똑같이 입력해 주세요");
        document.getElementById("pw").focus();
        return false;
    }//if end

    //4)이름 두글자 이상 인지?
    let name=document.getElementById("name").value;
    name=name.trim();
    if(name.length<=1){
        alert("이름 두글자 이상 입력해 주세요");
        document.getElementById("name").focus();
        return false;
    }//if end

    //5)이메일 5글자 인지?
    let email=document.getElementById("email").value;
    email=email.trim();
    if(email.length<5){
        alert("이메일 5글자 이상 입력해 주세요");
        document.getElementById("email").focus();
        return false;
    }//if end

    //6)직업을 선택했는지?
    let job=document.getElementById("job").value;
    if(job=="0"){
        alert("직업 선택해 주세요");
        return false;
    }//if end

    return true;//서버로 전송

}//memberCheck() end*/
