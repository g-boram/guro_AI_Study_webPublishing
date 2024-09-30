$(function () {
  let content = 0;
  if (content == 0) {
    $(".textCount").text("0자");
  }

  $("#textBox").keyup(function (e) {
    content = $(this).val();

    // 글자수 세기
    if (content.length == 0 || content == "") {
      $(".textCount").text("0자");
    } else {
      $(".textCount").text(content.length + "자");
    }

    // 글자수 제한
    if (content.length > 100) {
      $(this).val($(this).val().substring(0, 100));

      alert("글자수는 100자까지 입력 가능합니다.");
    }
  });
});
