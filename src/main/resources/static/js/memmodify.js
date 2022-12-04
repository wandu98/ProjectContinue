function updateCheck() {
    // 아이디 체크
    let mem_id = document.getElementById("mem_id").value;
    mem_id = mem_id.trim();
    if (mem_id.length == 0) {
        alert("아이디를 입력해주세요");
        document.getElementById("mem_id").focus();
        return false;
    }

    // 이름 체크
    let mem_name = document.getElementById("mem_name").value;
    mem_name = mem_name.trim();
    if (mem_name.length == 0) {
        alert("이름을 입력해주세요");
        document.getElementById("mem_name").focus();
        return false;
    }

    // 닉네임 체크
    let mem_nick = document.getElementById("mem_nick").value;
    mem_nick = mem_nick.trim();
    if (mem_nick.length == 0) {
        alert("닉네임을 입력해주세요");
        document.getElementById("mem_nick").focus();
        return false;
    }

    // 비밀번호 체크
    let mem_pw = document.getElementById("mem_pw").value;
    let mem_pwcheck = document.getElementById("mem_pwcheck").value;
    mem_pw = mem_pw.trim();
    mem_pwcheck = mem_pwcheck.trim();

    if (mem_pw.length == 0) {
        alert("비밀번호를 입력해주세요");
        document.getElementById("mem_pw").focus();
        return false;
    }

    if (mem_pwcheck.length == 0) {
        alert("비밀번호 확인을 입력해주세요");
        document.getElementById("mem_pwcheck").focus();
        return false;
    }

    if (mem_pw != mem_pwcheck) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        document.getElementById("mem_pwcheck").focus();
        return false;
    }

    // 우편번호, 주소 체크
    let mem_zip = document.getElementById("mem_zip").value;
    let mem_adr1 = document.getElementById("mem_adr1").value;
    let mem_adr2 = document.getElementById("mem_adr2").value;
    if (mem_zip.length == 0 || mem_adr1.length == 0 || mem_adr2.length == 0) {
        alert("주소를 입력해주세요")
        return false;
    }

    // 생년월일 체크
    let mem_birth = document.getElementById("mem_birth").value;
    if (mem_birth.length == 0) {
        alert("생년월일을 입력해주세요")
        return false;
    }

}