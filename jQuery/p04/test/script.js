$(function () {
  // 기존 - 모달 열기
  // $(".imgCD").click(function () {
  //   let src = $(this).attr("name");
  //   $("#modalContainer").empty().append(`<img src="${src}"/>`);
  //   $("#modalContainer").css("display", "flex");
  //   console.log("no");
  // });

  // 추가
  $(".imgCD").click(function () {
    let src = $(this).attr("name");
    $("#modalContainer").css("display", "flex");
    $("#modalContent").empty().append(`
      <img src="${src}"/>
    `);
    console.log(src);
  });

  // 기존 - 모달 닫기
  // $("#modalContainer").click(function () {
  //   $("#modalContainer").css("display", "none");
  //   // $("#modalContent").empty();
  // });

  // 추가
  $(".modalCloseBtn").click(function () {
    $("#modalContainer").css({ display: "none" });
  });
});
