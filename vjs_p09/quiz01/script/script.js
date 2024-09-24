const dom = document.querySelector("input");
dom.addEventListener("keypress", function (event) {

  //  input의 value 가져오기
  let url = dom.value;
  
  // event => JS의 BOM(브라우저 객체 모델)
  let code = event.keyCode;
  if (code == 13) {
    // console.log("code : " + code);
    // console.log("url : " + url);    
    location.href=url;
  }

  
});