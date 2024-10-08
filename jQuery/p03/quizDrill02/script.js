// const testValue = "";

// let testValue = "";
// 팝업 띄우기 함수 -----------------------------------------------------
const openPopup = () => {
  const testValue = document.querySelector("#id").value;

  let scrWid = screen.width;
  let scrHei = screen.height;
  let popWid = 400;
  let popHei = 300;
  let lefPos = (scrWid - popWid) / 2;
  let topPos = (scrHei - popHei) / 2;
  // 팝업을 띄울 페이지 URL
  var popupURL = "./popUp.html";
  // 팝업 창의 속성
  var option = "width=" + popWid + "px, ";
  option += "height=" + popHei + "px, ";
  option += "left=" + lefPos + "px, ";
  option += "height=" + topPos + "px, ";

  console.log("testValue", testValue);

  // 팝업 열기
  const openWin = window.open(popupURL, "Popup", option);
  openWin.document.getElementById("test").value = testValue;

  // testFn(testValue);
};
// const testFn = (testValue) => {
//   document.getElementById("test").value = testValue;
// };
// testFn();

const testSubmit = () => {};

// 비밀번호 일치, 불일치 ----------------------------------------------------
const matchingPW = () => {
  const pw = document.querySelector("#pw").value;
  const rPw = document.querySelector("#rPw").value;

  if (pw == rPw) {
    document.querySelector("#pwResult").innerHTML = "비밀번호 일치";
  } else {
    document.querySelector("#pwResult").innerHTML = "비밀번호 불일치";
  }
};

// select 선택시 입력값 넣기 ------------------------------------------------
const inputUrl = () => {
  let sel = document.getElementById("urlSelect");
  let value = sel.value;

  document.getElementById("emailUrl").value = value;
};

// 정규표현식 적용 ----------------------------------------------------------
const regTest = () => {
  const id = document.getElementById("id").value;
  const pw = document.getElementById("pw").value;
  const email = document.getElementById("email").value;

  // 영어 대/소문자, 숫자만 가능합니다.
  const engAndNum = /^[A-Za-z0-9]+$/;
  // 영어 대/소문자, 숫자, _, @만 가능합니다.
  const engAndNumAndOther = /^[A-Za-z0-9_@]+$/;
  // 이메일에는 공백을 사용할 수 없습니다.
  const noSpace = /^[^s]+$/;

  let checkId = engAndNum.test(id);
  let checkPw = engAndNumAndOther.test(pw);
  let checkEmail = noSpace.test(email);

  if (!checkId) {
    alert("아이디 값을 확인해 주세요");
  } else if (!checkPw) {
    alert("비밀번호 값을 확인해 주세요");
  } else if (!checkEmail) {
    alert("이메일 값을 확인해 주세요");
  } else {
    // window.location("./success.html");
    $(location).attr("href", "success.html");
  }
  // 분기 처리 하기 귀찮아서 안함.
};

function closePopUp() {
  window.close();
}
