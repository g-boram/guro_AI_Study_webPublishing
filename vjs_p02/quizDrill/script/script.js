function fnTest() {
  let inputData1 = document.querySelector("#value1").value;
  let inputData2 = document.querySelector("#value2").value;

  let result = (inputData2 / inputData1) * 100;
  document.querySelector("#resData").innerHTML = result.toFixed(1) + " %";
}
