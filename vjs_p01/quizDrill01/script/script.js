function func1() {
  let refText = document.querySelector("#ref").innerText;
  document.querySelector("#output").innerText = refText;
}

function func2() {
  document.querySelector("#output").style.border = "2px solid #f80";
  document.querySelector("#output").style.fontWeight = "bold";
}
