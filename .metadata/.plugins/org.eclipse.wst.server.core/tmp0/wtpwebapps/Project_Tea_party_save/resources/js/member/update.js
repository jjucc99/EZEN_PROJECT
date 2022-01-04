const userPw = document.querySelector("#mem_pwd");
const checkPw = document.querySelector("#check_pwd");
const idPwCheck = document.querySelector("#idPwCheck");

let goPw = null;

function handleCheckSubmit(e) {
    if (goPw !== "Y") {
        alert("비밀번호를 확인해주시기 바랍니다.");
        goPw = "N";
        return false;
    }
    return true;
}

function handleCheckPw(e) {
    const userOfPw = userPw.value;
    const checkOfPw = checkPw.value;

    if (userOfPw == checkOfPw) {
        goPw = "Y";
        idPwCheck.innerText = "비밀번호가 일치합니다.";
    } else {
        idPwCheck.innerText = "비밀번호가 일치 하지 않습니다.";
        goPw = "N";
    }

}

checkPw.addEventListener("input", handleCheckPw);
userPw.addEventListener("input", handleCheckPw);
