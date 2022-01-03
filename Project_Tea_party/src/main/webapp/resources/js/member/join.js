const checkId = document.querySelector(".check");
const input = document.querySelector("#mem_id");
const responseResult = document.querySelector(".responseResult");

const userPw = document.querySelector("#mem_pwd");
const checkPw = document.querySelector("#check_pwd");
const idPwCheck = document.querySelector("#idPwCheck");

const checkSubmit = document.querySelector("form");


let originId = "";
let originPw = "";
let goId = null;
let goPw = null;


// XMLHttpRequest 객체의 생성
const xhr = new XMLHttpRequest();

// // 비동기 방식으로 Request를 오픈한다
// xhr.open('POST', '/checkId');
//
// // 클라이언트가 서버로 전송할 데이터의 MIME-type 지정: json
// xhr.setRequestHeader('Content-type', 'application/json');

// // 서버가 센드백할 데이터의 MIME-type 지정: json
// xhr.setRequestHeader('Accept', 'application/json');

//데이터를 전달
// 열린 다음 바로 전달 안하면 포트가 닫히면서 오류가 난다.
//const strObject = JSON.stringify(o);
//xhr.send(strObject);

// // XMLHttpRequest.readyState 프로퍼티가 변경(이벤트 발생)될 때마다 콜백함수(이벤트 핸들러)를 호출한다.
// xhr.onreadystatechange = function (e) {
//     // 이 함수는 Response가 클라이언트에 도달하면 호출된다.
//     // readyStates는 XMLHttpRequest의 상태(state)를 반환
//     // readyState: 4 => DONE(서버 응답 완료)
//     if (xhr.readyState !== XMLHttpRequest.DONE) return;
//
//     // status는 response 상태 코드를 반환 : 200 => 정상 응답
//     if (xhr.status === 200) {
//         let responseText = xhr.responseText;
//         console.log(responseText);
//     } else {
//         console.log(`[${xhr.status}] : ${xhr.statusText}`);
//
//     }
// };

function handleCheckID(e) {
    //이걸 보내면 js Object 로 가게 된다.
    let responseText = null;
    const inputId = input.value;
    // const getId = {
    //     inputId: inputId
    // }
    const sendId = JSON.stringify(inputId);
    // 비동기 방식으로 Request를 오픈한다
    xhr.open('POST', '/checkId');

    // 클라이언트가 서버로 전송할 데이터의 MIME-type 지정: json
    xhr.setRequestHeader('Content-type', 'application/json');

    xhr.send(inputId);

    xhr.onreadystatechange = function (e) {
        if (xhr.readyState !== XMLHttpRequest.DONE) return;

        // status는 response 상태 코드를 반환 : 200 => 정상 응답
        if (xhr.status === 200) {
            responseText = xhr.responseText;
            console.log("여기는 연결 성공");
            console.log(responseText);
            // 여기서 아이디 중복
            if (responseText == "N") {
                // 이미 존재하는 아이디 입니다.
                responseResult.innerText = "이미 존재하는 아이디 입니다.";
                goId = "N";
            } else {
                //사용 가능한 아이디입니다.
                responseResult.innerText = "사용 가능한 아이디입니다.";
                goId = "Y";
            }
        } else {
            console.log(`[${xhr.status}] : ${xhr.statusText}`);
            originId = "";
        }
    };
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


function handleCheckSubmit(e) {


    if (goId !== "Y") {
        alert("아이디 중복을 확인해주시기 바랍니다.");
        goId = "N";
        return false;
    }

    if (goPw !== "Y") {
        alert("비밀번호를 확인해주시기 바랍니다.");
        goPw = "N";
        return false;
    }
    return true;
}

input.addEventListener("input", handleCheckID);
checkPw.addEventListener("input", handleCheckPw);
userPw.addEventListener("input", handleCheckPw);
